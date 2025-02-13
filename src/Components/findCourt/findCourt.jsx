import React, { useState, useEffect } from 'react';
import './findcourt.css';
import { TimePicker, Modal, Button, Rate, Input } from 'antd';
import { useLocation, useNavigate } from 'react-router-dom';
import Header from '../Header/header';
import Navbar from '../Navbar/Navbar';
import Footer from '../Footer/Footer';
import image2 from '../../Assets/image2.jpg';
import userImg from '../../Assets/user.jpg';
import { jwtDecode } from 'jwt-decode';
import { toast } from 'react-toastify';

const { RangePicker } = TimePicker;
const { TextArea } = Input;

const FindCourt = () => {
  const [timeRange, setTimeRange] = useState([null, null]);
  const [courts, setCourts] = useState([]);
  const [branches, setBranches] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [selectedBranch, setSelectedBranch] = useState('');
  const [selectedCourt, setSelectedCourt] = useState('');
  const [feedback, setFeedback] = useState([]);
  const [users, setUsers] = useState([]);
  const [loadingFeedback, setLoadingFeedback] = useState(false);
  const [errorFeedback, setErrorFeedback] = useState('');
  const [isModalVisible, setIsModalVisible] = useState(false);
  const [newRating, setNewRating] = useState(0);
  const [newContent, setNewContent] = useState('');
  const [selectedFeedback, setSelectedFeedback] = useState(null);
  const token = sessionStorage.getItem("token");

  const location = useLocation();
  const navigate = useNavigate();

  useEffect(() => {
    const params = new URLSearchParams(location.search);
    const branchId = params.get('branch');
    if (branchId) {
      setSelectedBranch(branchId);
    }
  }, [location]);

  const onChange = (time) => {
    setTimeRange(time);
  };

  const handleBranchChange = (event) => {
    const branchId = event.target.value;
    setSelectedBranch(branchId);
    setSelectedCourt(''); // Reset selected court when branch changes
  };

  const handleCourtChange = (event) => {
    const courtId = event.target.value;
    setSelectedCourt(courtId);
  };

  const filteredCourts = courts.filter((court) => {
    return (
      (selectedBranch === '' || court.branchId === selectedBranch) &&
      (selectedCourt === '' || court.courtId === selectedCourt)
    );
  });

  const filteredFeedback = feedback.filter((fb) => {
    return (
      fb.isDelete !== true && (selectedBranch === '' || fb.branchId === selectedBranch)
    );
  });

  const extractImageUrls = (courtImg) => {
    const regex = /([^|]+)/g;
    let matches;
    const urls = [];
    while ((matches = regex.exec(courtImg)) !== null) {
      urls.push(matches[0]);
    }
    return urls;
  };

  const formatDateTime = (dateString) => {
    const date = new Date(dateString);
    const formattedDate = date.toLocaleDateString('en-GB', {
      day: '2-digit',
      month: '2-digit',
      year: 'numeric'
    }).replace(/\//g, '-');
    const formattedTime = date.toLocaleTimeString('en-GB', {
      hour: '2-digit',
      minute: '2-digit'
    });
    return `${formattedDate} ${formattedTime}`;
  };

  useEffect(() => {
    const fetchData = async () => {
      const branchUrl = 'https://localhost:7233/Branch/GetAll';
      const courtUrl = 'https://localhost:7233/Court/GetAll';

      try {
        setLoading(true);
        const [branchResponse, courtResponse] = await Promise.all([
          fetch(branchUrl),
          fetch(courtUrl),
        ]);

        if (!branchResponse.ok) {
          throw new Error(`Failed to fetch branch data: ${branchResponse.statusText}`);
        }
        if (!courtResponse.ok) {
          throw new Error(`Failed to fetch court data: ${courtResponse.statusText}`);
        }

        const branchData = await branchResponse.json();
        const courtData = await courtResponse.json();

        const filteredBranchData = branchData.filter(branch => branch.branchStatus !== 0);

        const courtsWithImages = courtData.map(court => {
          const imageUrl = court.courtImg ? extractImageUrls(court.courtImg)[0] : image2;
          return {
            ...court,
            image: imageUrl
          };
        });

        setBranches(filteredBranchData);
        setCourts(courtsWithImages);

      } catch (error) {
        setError(error.message);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  useEffect(() => {
    const fetchFeedback = async () => {
      const feedbackUrl = 'https://localhost:7233/Feedback/GetAll';
      const userUrl = 'https://localhost:7233/User/GetAll';
      const userDetailsUrl = 'https://localhost:7233/UserDetail/GetAll';

      setLoadingFeedback(true);
      try {
        const [feedbackResponse, userResponse, userDetailsResponse] = await Promise.all([
          fetch(feedbackUrl),
          fetch(userUrl),
          fetch(userDetailsUrl)
        ]);

        if (!feedbackResponse.ok) {
          throw new Error(`Failed to fetch feedback data: ${feedbackResponse.statusText}`);
        }
        if (!userResponse.ok) {
          throw new Error(`Failed to fetch user data: ${userResponse.statusText}`);
        }
        if (!userDetailsResponse.ok) {
          throw new Error(`Failed to fetch user details: ${userDetailsResponse.statusText}`);
        }

        const feedbackData = await feedbackResponse.json();
        console.log('fetched feedback data', feedbackData);
        const userData = await userResponse.json();
        const userDetailsData = await userDetailsResponse.json();

        const feedbackWithUserDetails = feedbackData.map(fb => {
          const user = userData.find(user => user.userId === fb.userId);
          const userDetails = userDetailsData.find(detail => detail.userId === fb.userId);
          return {
            ...fb,
            formattedDateTime: formatDateTime(fb.period),
            user: {
              ...user,
              image: userDetails ? userDetails.img : null,
              firstName: userDetails ? userDetails.firstName : '',
              lastName: userDetails ? userDetails.lastName : ''
            }
          };
        });

        //Sort feedback by date in descending order
        feedbackWithUserDetails.sort((a, b) => new Date(b.period).getTime() - new Date(a.period).getTime());

        setFeedback(feedbackWithUserDetails);
        setUsers(userData);
      } catch (error) {
        setErrorFeedback('Failed to load feedback');
      } finally {
        setLoadingFeedback(false);
      }
    };

    fetchFeedback();
  }, []);

  const handleBook = (courtId) => {
    navigate(`/viewCourtInfo?courtId=${courtId}`);
  };

  const renderStars = (rating) => {
    const fullStar = '★';
    const emptyStar = '☆';
    return (
      <span className="stars">
        {fullStar.repeat(rating) + emptyStar.repeat(5 - rating)}
      </span>
    );
  };

  const handleDelete = async (feedbackId, feedbackUserId) => {
    const token = sessionStorage.getItem('token');
    if (!token) {
      alert("You need to log in to delete feedback.");
      return;
    }

    let decodedToken;
    try {
      decodedToken = jwtDecode(token);
    } catch (error) {
      sessionStorage.clear();
      navigate('/');
      return;
    }

    const currentUserId = decodedToken.UserId;

    if (currentUserId !== feedbackUserId) {
      alert("You don't have permission to delete this feedback.");
      return;
    }

    try {
      const response = await fetch(
        `https://localhost:7233/Feedback/Delete?id=${feedbackId}&userID=${currentUserId}`,
        {
          method: 'DELETE',
          headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
          }
        }
      );

      if (!response.ok) {
        throw new Error('Failed to delete feedback');
      }

      // Remove the deleted feedback from the state
      setFeedback(prevFeedback => prevFeedback.filter(fb => fb.feedbackId !== feedbackId));
      toast.success('Feedback deleted success');
    } catch (error) {
      console.error('Error deleting feedback:', error);
      alert('Failed to delete feedback. Please try again.');
    }
  };

  const handleEdit = async (feedbackId, rating, content, userId) => {
    const token = sessionStorage.getItem('token');
    if (!token) {
      alert("You need to log in to edit feedback.");
      return;
    }

    let decodedToken;
    try {
      decodedToken = jwtDecode(token);
    } catch (error) {
      sessionStorage.clear();
      navigate('/');
      return;
    }

    const currentUserId = decodedToken.UserId;

    if (currentUserId !== userId) {
      alert("You don't have permission to edit this feedback.");
      return;
    }

    try {
      const url= `https://localhost:7233/Feedback/Update?rate=${rating}&content=${encodeURIComponent(content)}&id=${feedbackId}&userId=${currentUserId}`;
      const response = await fetch(url, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`
        }
      });

      if(!response.ok) {
        throw new Error(`Failed to update feedback: ${response.statusText}`);
      }

      const updatedFeedback = await response.json();
      setFeedback((prevFeedback) =>
        prevFeedback.map((fb) => 
          fb.feedbackId === feedbackId? updatedFeedback: fb
        )
      );

      setIsModalVisible(false);
      setSelectedFeedback(null);
      setNewRating(0);
      setNewContent('');
      window.location.reload();
    } catch (error) {
      console.error(error);
      setErrorFeedback('Failed to update feedback');
    }
  };

  const handleEditButtonClick = (fb) => {
    setSelectedFeedback(fb);
    setNewRating(fb.rating);
    setNewContent(fb.content);
    setIsModalVisible(true);
  };

  const handleModalOk = async () => {
    const token = sessionStorage.getItem('token');
    if (!token) {
      alert("You need to log in to edit feedback.");
      return;
    }

    const decodedToken = jwtDecode(token);
    const userIdToken = decodedToken.UserId;

    const feedbackData = {
      userId: userIdToken,
      rating: newRating,
      content: newContent,
      feedbackId: selectedFeedback ? selectedFeedback.feedbackId : undefined,
    };

    try {
      const url = `https://localhost:7233/Feedback/Update?rate=${feedbackData.rating}&content=${feedbackData.content}&id=${feedbackData.feedbackId}&userId=${feedbackData.userId}`;
      const response = await fetch(url, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`
        }
      });

      if (!response.ok) {
        throw new Error(`Failed to update feedback: ${response.statusText}`);
      }

      const updatedFeedback = await response.json();
      setFeedback((prevFeedback) =>
        prevFeedback.map((fb) =>
          fb.feedbackId === selectedFeedback.feedbackId ? updatedFeedback : fb
        )
      );

      setIsModalVisible(false);
      setSelectedFeedback(null);
      setNewRating(0);
      setNewContent('');
      window.location.reload();
    } catch (error) {
      console.error(error);
      setErrorFeedback('Failed to update feedback');
    }
  };

  const handleModalCancel = () => {
    setIsModalVisible(false);
    setSelectedFeedback(null);
    setNewRating(0);
    setNewContent('');
  };

  const formatPrice = (n) => {
    function formatTo3Digits(n, stop) {
        var rs = ''
        if (!stop)
          for (var i = 1; i <= 3; i++) {
            rs = (n % 10) + rs
            n = Math.floor(n / 10)
          }
        else rs = n + rs
        return rs
      }
      if (Object.is(n, NaN)) return 0
      n = Math.floor(n)
      var rs = ''
      do {
        rs = formatTo3Digits(n % 1000, Math.floor(n / 1000) === 0) + rs
        n = Math.floor(n / 1000)
        if (n > 0) rs = ',' + rs
      }
      while (n > 0)
      return rs
  }

  return (
    <div className="findCourt">
      {token != null && (
        <div className="findCourtHeader">
        <Header />
      </div>
      )}
      {token == null && (
        <Navbar />
      )}
      <div className="findCourt-wrapper">
        <div className="background">
          <div>
            <section className="findCourt-find">
              <div className="secContainer container">
                <div className="findCourt-homeText">
                  <h1 className="findcourt-Title">Find a Court</h1>
                </div>

                <div className="findCourt-searchCard grid">
                  <div className="branchDiv">
                    <label htmlFor="branch">Branch</label>
                    <select
                      onChange={handleBranchChange}
                      value={selectedBranch}
                    >
                      {branches.map((branch) => (
                        <option key={branch.branchId} value={branch.branchId}>
                          {branch.branchName}
                        </option>
                      ))}
                    </select>
                  </div>

                  <div className="findCourt-courtDiv">
                    <label htmlFor="court">Court</label>
                    <select
                      onChange={handleCourtChange}
                      value={selectedCourt}
                    >
                      {courts
                        .filter(court => !selectedBranch || court.branchId === selectedBranch)
                        .map((court) => (
                          <option key={court.courtId} value={court.courtId}>
                            {court.courtName}
                          </option>
                        ))}
                    </select>
                  </div>
                </div>
              </div>

              <div className="findCourt-courtList">
                {loading && <p>Loading...</p>}
                {error && <p>{error}</p>}
                {filteredCourts.map((court) => {
                  const branch = branches.find(branch => branch.branchId === court.branchId);
                  return (
                    <div className="findCourt-courtCard" key={court.courtId}>
                      <div className="findCourt-courtImage">
                        <img src={court.image || image2} alt={`Court ${court.courtId}`} />
                      </div>
                      <div className="findCourt-courtInfo">
                        <h2>Court Name: {court.courtName}</h2>
                        <p>Branch: {branch ? branch.branchName : 'Unknown Branch'}</p>
                        <p>Address: {branch ? branch.location : 'Unknown Address'}</p>
                        <p>Price: {formatPrice(court.price)} VND</p>
                        <p>Description: {court.description}</p>
                        <button className="findCourt-bookBtn" onClick={() => handleBook(court.courtId)}>Book</button>
                      </div>
                    </div>
                  );
                })}
              </div>

              <div className="findcourt-feedbackBox">
                <h1>User Feedback</h1>
                {loadingFeedback && <p>Loading feedback...</p>}
                {errorFeedback && <p>{errorFeedback}</p>}
                <div className="findcourt-feedbackGrid">
                  {filteredFeedback.map((fb) => {
                    const user = fb.user;
                    const token = sessionStorage.getItem('token');
                    let userIdToken;

                    if (token) {
                      try {
                        const decodedToken = jwtDecode(token);
                        userIdToken = decodedToken.UserId;
                      } catch (error) {
                        console.error('Invalid token', error);
                        sessionStorage.clear();
                        navigate('/');
                        return null;
                      }
                    }

                    return (
                      <div key={fb.feedbackId} className="findcourt-feedbackCard">
                        <div className="findcourt-feedbackInfo">
                          <div className="findcourt-user-info">
                            <img src={user ? user.image || userImg : userImg} alt={`User ${user ? user.userName : 'Unknown User'}`} className="findcourt-user-image" />
                            <div className="findcourt-user-details">
                              <p className="findcourt-user-name"><strong>{user ? user.firstName + " " + user.lastName : 'Anonymous'}</strong></p>
                              <p className="findcourt-user-rating"><span className="stars">{renderStars(fb.rating)}</span></p>
                            </div>
                          </div>
                          {selectedBranch && <p>Branch: {branches.find(branch => branch.branchId === fb.branchId)?.branchName}</p>}
                          <p>Feedback: {fb.content}</p>
                          <p className='feedback-datetime'>{fb.formattedDateTime}</p>
                        </div>
                        {token && userIdToken === fb.userId && (
                          <div className="feedback-actions">
                            <button
                              className="find-court-delete-feedback-btn"
                              onClick={() => handleDelete(fb.feedbackId, fb.userId)}
                            >
                              Delete
                            </button>
                            <button
                              className='find-court-edit-feedback-btn'
                              onClick={() => handleEditButtonClick(fb)}
                            >
                              Edit
                            </button>
                          </div>
                        )}
                      </div>
                    );
                  })}
                </div>
              </div>
            </section>
          </div>
        </div>
      </div>
      <div className="findCourtFooter">
        <Footer />
      </div>
      <Modal
        title={<div className="findcourt-modal-title">Edit Feedback</div>}
        visible={isModalVisible}
        onOk={handleModalOk}
        onCancel={handleModalCancel}
        footer={[
          <Button key="cancel" onClick={handleModalCancel} className="findcourt-modal-cancel-btn">
            Cancel
          </Button>,
          <Button key="ok" type="primary" onClick={handleModalOk} className="findcourt-modal-ok-btn">
            OK
          </Button>,
        ]}
        className="findcourt-modal"
      >
        <div className="findcourt-modal-content">
          <div className="findcourt-rating-container">
            <p>Rating: </p>
            <Rate onChange={setNewRating} value={newRating} />
          </div>
          <TextArea
            rows={4}
            onChange={(e) => setNewContent(e.target.value)}
            value={newContent}
          />
        </div>
      </Modal>
    </div>
  );
};

export default FindCourt;

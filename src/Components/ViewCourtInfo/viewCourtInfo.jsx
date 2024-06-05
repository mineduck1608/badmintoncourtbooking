import React, { useEffect, useState } from 'react';
import Header from "../Header/header";
import './viewCourtInfo.css'
import Footer from "../Footer/Footer";
import image2 from '../../Assets/image2.jpg';

const ViewCourtInfo = () => {
    const [branch, setBranch] = useState(null);
    const [court, setCourt] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchData = async () => {
            const branchUrl = 'http://localhost:5266/Branch/GetAll';
            const courtUrl = 'http://localhost:5266/Court/GetAll';

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

                // Log the data to see its structure
                //console.log('Branch Data:', branchData);
                //console.log('Court Data:', courtData);

                // Assuming the API returns arrays, we'll just take the first element
                if (branchData.length > 0) {
                    setBranch(branchData[0]);
                }
                if (courtData.length > 0) {
                    setCourt(courtData[0]);
                }

            } catch (error) {
                setError(error.message);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, []);

    if (loading) return <div>Loading...</div>;
    if (error) return <div>Error: {error}</div>;

    return (
        <div className="viewcourtinfo">
            <div>
                <Header />
            </div>
            <div className="viewcourtinfo-body">
                <div className="viewcourtinfo-body-pic">
                    <img className="viewcourtinfo-img" src={image2} alt="" />
                    <div className="viewcourtinfo-info">

                        <h2>Court no: {court.courtId}</h2>
                        <p>Address: {branch.location}</p>
                        <p>Time: AAAAA</p>
                        <p>Branch: {branch.branchName}</p>
                        <p>Status: FREE</p>
                    </div>
                </div>
                <div className="viewcourtinfo-body-des">
                    <h1>Description:</h1>
                    <p>{court.description}</p>
                </div>
            </div>


            <div className="viewcourtinfo-feedback">

            </div>
            <div className="viewcourtinfo-footer">
                <Footer />
            </div>
        </div>
    );
}

export default ViewCourtInfo
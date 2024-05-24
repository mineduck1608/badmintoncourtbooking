import React, { useState } from 'react'
import './navbar.css'
import { MdSportsTennis } from "react-icons/md";
import { AiFillCloseCircle } from "react-icons/ai";
import { TbGridDots } from "react-icons/tb";


const Navbar = () => {

    //Code to toggle/show navBar
    const [active, setActive] = useState('navBar')
    const showNav = () => {
        setActive('navBar activeNavbar')
    }

    // Code to remove Navbar
    const removeNav = () => {
        setActive('navBar ')
    }

    //Code to add background color to the header...
    const [transparent, setTransparent] = useState('header')
    const addBg = () => {
        if (window.scrollY >= 10) {
            setTransparent('header activeHeader')
        }
        else {
            setTransparent('header')
        }
    }
    window.addEventListener('scroll', addBg)

    return (
        <section className='navBarSection'>
            <div className={transparent}>

                <div className="logoDiv">
                    <a href="#" className="logo">
                        <h1 className='flex'><MdSportsTennis className="icon" />
                            BMTC
                        </h1>
                    </a>
                </div>

                <div className={active}>
                    <ul className="navLists flex">

                        <li className="navItem">
                            <a href="#" className="navLink">Home</a>
                        </li>

                        <li className="navItem">
                            <a href="#" className="navLink">Booking Details</a>
                        </li>

                        <li className="navItem">
                            <a href="#" className="navLink">Contacts</a>
                        </li>

                        <div className="headerBtns flex">
                            <button className='btn loginBtn'>
                                <a href="/signin">Login</a>
                            </button>
                            <button className='btn '>
                                <a href="/signup">Sign Up</a>
                            </button>
                        </div>

                    </ul>

                    <div onClick={removeNav} className="closeNavbar">
                        <AiFillCloseCircle className="icon" />
                    </div>
                </div>

                <div onClick={showNav} className="toggleNavbar">
                    <TbGridDots className="icon" />

                </div>
            </div>
        </section>
    )
}

export default Navbar

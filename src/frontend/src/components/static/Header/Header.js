import React, { useState, useRef, useEffect, useCallback } from "react";
import "../Header/Header.css";
import Sidebar from "../Menu/SidebarMenu";
import { VscSignOut } from "react-icons/vsc";
import Logo from "../../../assets/img/RxLogo.png";
import MenuIcon from "../../../assets/img/Menu.svg";
import { Link, useNavigate } from "react-router-dom";
import AlertIcon from "../../../assets/img/AlertIcon.svg";
import RewardIcon from "../../../assets/img/RewardIcon.svg";
import ProfileIcon from "../../../assets/img/ProfileIcon.svg";
import useApiServiceCall from "../../../hooks/useApiServiceCall";

const colors = [
    "#e57373",
    "#f06292",
    "#ba68c8",
    "#64b5f6",
    "#4db6ac",
    "#81c784",
    "#ffb74d",
    "#ff8a65",
    "#a1887f",
    "#90a4ae",
    "#7986cb",
    "#ff8c00",
    "#008080",
    "#556b2f",
    "#8b0000",
    "#9932cc",
    "#ff1493",
    "#008b8b",
    "#006400",
    "#b22222",
    "#ff4500",
    "#2e8b57",
    "#8a2be2",
    "#d2691e",
    "#dc143c",
    "#000080",
];

const friends = [
    { name: "Alice", link: "/profile" },
    { name: "Bob", link: "/profile" },
    { name: "Charlie", link: "/profile" },
    { name: "David", link: "/profile" },
    { name: "Jon", link: "/profile" },
    { name: "Mon", link: "/profile" },
    { name: "Gon", link: "/profile" },
    { name: "Shahnaj Begum", link: "/profile" },
];

const getColorForLetter = (letter) => {
    const index = letter.toUpperCase().charCodeAt(0) - 65;
    return colors[index] || "#000";
};

function Header() {
    const [isSidebarOpen, setIsSidebarOpen] = useState(false);
    const [isProfileMenuVisible, setIsProfileMenuVisible] = useState(false);
    const profileMenuRef = useRef(null);
    const profileIconRef = useRef(null);
    const navigate = useNavigate();

    // Destructuring api call function
    const { logout } = useApiServiceCall();

    const toggleSidebar = useCallback(() => {
        setIsSidebarOpen((prev) => !prev);
    }, []);

    const toggleProfileMenu = useCallback((e) => {
        // Prevent event bubbling to avoid immediate close when clicking the icon
        e.stopPropagation();
        const newVisibility = !isProfileMenuVisible;
        setIsProfileMenuVisible(newVisibility);
        
        // Adjust menu position if it would go outside viewport
        if (newVisibility && profileMenuRef.current && profileIconRef.current) {
            setTimeout(() => {
                const menu = profileMenuRef.current;
                const icon = profileIconRef.current;
                const rect = icon.getBoundingClientRect();
                const menuWidth = 220; // Menu width
                const viewportWidth = window.innerWidth;
                
                // Check if menu would go outside right edge
                if (rect.right - menuWidth < 0) {
                    // Position menu to the left of the icon
                    menu.style.right = 'auto';
                    menu.style.left = '0';
                } else {
                    // Default position to the right
                    menu.style.left = 'auto';
                    menu.style.right = '0';
                }
            }, 10);
        }
    }, [isProfileMenuVisible]);

    const handleLogout = useCallback(() => {
        localStorage.clear();
        logout("");
    }, [navigate]);

    useEffect(() => {
        const handleClickOutside = (event) => {
            // Close if clicked outside both profile icon and menu
            if (
                profileMenuRef.current &&
                !profileMenuRef.current.contains(event.target) &&
                profileIconRef.current &&
                !profileIconRef.current.contains(event.target)
            ) {
                setIsProfileMenuVisible(false);
            }
        };
        
        if (isProfileMenuVisible) {
            document.addEventListener("mousedown", handleClickOutside);
        }
        
        return () => {
            document.removeEventListener("mousedown", handleClickOutside);
        };
    }, [isProfileMenuVisible]);

    return (
        <>
            <div className="header-menu">
                <div className="group-2">
                    <div className="menu-icon">
                        <button
                            onClick={toggleSidebar}
                            className="menu-button p-0"
                        >
                            <img
                                src={MenuIcon}
                                className="showHideMenuImg"
                                alt="Menu Toggle"
                            />
                        </button>

                        <Sidebar
                            isOpen={isSidebarOpen}
                            toggleSidebar={() => setIsSidebarOpen(false)}
                        />

                        {/* <Link to="/profileDetails" className="profile-link">
                            <img src={RewardIcon} className="customprofing" alt="Profile" />
                        </Link> */}
                    </div>
                    <div className="logo ps-4">
                        <Link to="/">
                            <img
                                src={Logo}
                                className="ps-2"
                                alt="Smart Rx Logo"
                            />
                        </Link>
                    </div>
                    <div className="profile-alert">
                        <div className="alert-icon">
                            <img src={AlertIcon} alt="Notifications" />
                        </div>
                        <div
                            className="profile-icon"
                            onClick={toggleProfileMenu}
                            ref={profileIconRef}
                        >
                            <img
                                src={ProfileIcon}
                                className="active cursor-pointer"
                                alt="Profile"
                            />
                        </div>
                        
                        {/* Profile Menu - positioned relative to header */}
                        <div
                            ref={profileMenuRef}
                            className={`profile-menu-container ${
                                isProfileMenuVisible ? "visible" : "hidden"
                            }`}
                        >
                <ul className="profile-menu">
                    <div style={{ borderBottom: "1px solid #ddd" }}>
                        <li>
                            <b>Friends & Family</b>
                        </li>
                    </div>
                    <div className="scroll-profile-menu">
                        {friends.map((friend, index) => {
                            const firstLetter = friend.name
                                .charAt(0)
                                .toUpperCase();
                            return (
                                <li key={index} className="profile-item">
                                    <div
                                        className="profile-icon-circle"
                                        style={{
                                            backgroundColor:
                                                getColorForLetter(firstLetter),
                                        }}
                                    >
                                        {firstLetter}
                                    </div>
                                    <Link to={friend.link}>
                                        &nbsp; &nbsp;{friend.name}
                                    </Link>
                                </li>
                            );
                        })}
                    </div>
                    <div style={{ borderTop: "1px solid #ddd" }}>
                        <li onClick={handleLogout} style={{ 
                            backgroundColor: '#f8f9fa', 
                            cursor: 'pointer',
                            borderTop: '1px solid #ddd',
                            marginTop: '5px'
                        }}>
                            <div className="d-flex align-items-center gap-2" style={{ 
                                padding: '10px',
                                color: '#c0392b',
                                fontWeight: '500'
                            }}>
                                <VscSignOut className="fs-5" />
                                <div>Logout</div>
                            </div>
                        </li>
                    </div>
                </ul>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

export default React.memo(Header);

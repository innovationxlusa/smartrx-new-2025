import { useState } from "react";
import "./HeroSection.css";
import Header from "../static/Header/Header";
import Footer from "../static/Footer/Footer";
import { Link, useLocation } from "react-router-dom";
import CustomButton from "../static/Commons/CustomButton";
import { useLocalStorage } from "../../hooks/useLocalStorage";
import { ReactComponent as MenuIcon } from "./../../assets/img/Menu.svg";
import { ReactComponent as BackIcon } from "./../../assets/img/ChevronRightNew.svg";
import { FaHouse, FaCircleInfo, FaHandshake, FaBookOpen, FaCirclePlay, FaLightbulb } from "react-icons/fa6";

// const HeroSection = ({ children, className = "", landingPage = true, bottomSection = true, customStyles, backIcon = false }) => {
//     const [isSidebarOpen, setIsSidebarOpen] = useState(false);
//     const [accessToken] = useLocalStorage("accessToken", ""); // Retrieve accessToken from localStorage
//     const location = useLocation();
//     const excludeMarginRoutes = ["/"];
//     const excludeHeaderAndFooterRoutes = ["/singIn", "signUp"];
//     const shouldApplyMargin = accessToken && !excludeMarginRoutes.includes(location.pathname);
//     const shouldNotShowHeaderAndFooter = excludeHeaderAndFooterRoutes.includes(location.pathname);

//     const navItems = [
//         { label: "Home", icon: <FaHouse />, link: "#" },
//         { label: "About Us", icon: <FaCircleInfo />, link: "#" },
//         { label: "Our Service", icon: <FaHandshake />, link: "#" },
//         { label: "User Guide", icon: <FaBookOpen />, link: "#" },
//         { label: "Watch Video", icon: <FaCirclePlay />, link: "#" },
//         { label: "Learn More", icon: <FaLightbulb />, link: "/learnMore" },
//     ];

//     return (
//         <div className={`panel panel-default landingTopSection d-flex flex-column ${className} ${isSidebarOpen ? "landing-page-extra-height" : ""}`}>
//             {/* Sticky Header */}

//             {!accessToken || !shouldNotShowHeaderAndFooter ? (
//                 <section className="stickyHeader px-md-5 px-4">
//                     <div className="d-flex justify-content-start align-items-center">
//                         <div className="menu-icon">
//                             <Link className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar" onClick={() => setIsSidebarOpen(!isSidebarOpen)}>
//                                 <MenuIcon className="showHideMenuImg" alt="Menu Toggle" />
//                             </Link>
//                         </div>
//                         {backIcon && (
//                             <Link className="nav-link ms-3 ms-md-5 me-4 me-md-0" to="/">
//                                 <BackIcon alt="Back icon" />
//                             </Link>
//                         )}
//                         <div className="SmartRxTopTxt text-center mx-auto" style={{ paddingRight: backIcon ? "88px" : "30px" }}>
//                             SMART RX
//                         </div>
//                     </div>

//                     <div className="collapse navbar-collapse" id="collapsibleNavbar">
//                         <ul className="navbar-nav d-flex flex-wrap mt-3 ms-4">
//                             {navItems.map((item, index) => (
//                                 <li key={index} className="nav-item" style={{ width: "fit-content" }}>
//                                     <Link className="nav-link d-inline-flex align-items-center gap-2" to={item.link}>
//                                         {item.icon} {item.label}
//                                     </Link>
//                                 </li>
//                             ))}
//                         </ul>
//                     </div>
//                 </section>
//             ) : (
//                 <Header />
//             )}

//             {/* Hero Content */}
//             {landingPage && (
//                 <section className="text-center" style={{ marginTop: accessToken ? "5.5rem" : "1.5rem" }}>
//                     <div className="hero-image-wrapper mx-auto">
//                         <div className="table-background-wrapper mx-1">
//                             <div className="text-end">
//                                 <div className="me-2 me-md-0">
//                                     <div className="main-3 me-4 me-md-0">
//                                         <p className="main-3-header ps-2 ps-md-3 pt-1 pt-md-2 pt-lg-3">FileRx Archive</p>
//                                         <p className="main-3-body ps-4 ps-md-5 pe-1 pe-md-3">Organize your family Prescription</p>
//                                     </div>
//                                 </div>
//                             </div>
//                             <div className="text-start my-5">
//                                 <div className="main-3">
//                                     <p className="main-3-header ps-2 ps-md-3 pt-1 pe-2 pe-md-3 pt-md-2 pt-lg-3">SmartRx Insights</p>
//                                     <p className="main-3-body ps-4 ps-md-5 pe-3 pe-md-3">Look into prescription Smartly</p>
//                                 </div>
//                             </div>
//                             <div className="text-end">
//                                 <div className="main-3 me-3">
//                                     <p className="main-3-header ps-2 ps-md-3 pe-2 pt-1 pt-md-2 pt-lg-3">SmartRx Health Guide</p>
//                                     <p className="main-3-body ps-4 ps-md-5">SmartEdx for Health literacy</p>
//                                 </div>
//                             </div>
//                         </div>
//                         <div className="box smart-rx-moto mt-3">Your RX, Our Service</div>
//                     </div>
//                 </section>
//             )}

//             {/* Main Content */}
//             <div className={`flex-grow-1 w-100 ${shouldApplyMargin ? "my-5 minHeight-hero" : ""}`}>{children}</div>

//             {/* Sticky Footer */}

//             {!accessToken || !shouldNotShowHeaderAndFooter ? (
//                 bottomSection && (
//                     <section className="stickyFooter">
//                         <div className="d-flex justify-content-center align-items-center">
//                             <Link to="/signUp" className="text-decoration-none me-4">
//                                 <CustomButton
//                                     isLoading={""}
//                                     type={"button"}
//                                     icon={""}
//                                     label={"Sign Up"}
//                                     disabled={""}
//                                     width={"161px"}
//                                     height={"57px"}
//                                     backgroundColor={""}
//                                     textColor={"var(--theme-font-color)"}
//                                     shape={""}
//                                     borderStyle={"15px"}
//                                     borderColor={"1px solid var(--theme-font-color)"}
//                                     iconStyle={{ color: "var(--theme-font-color)" }}
//                                     labelStyle={{ fontSize: "16px", fontWeight: "400", textTransform: "capitalize" }}
//                                     hoverEffect={"theme"}
//                                 />
//                             </Link>
//                             <Link to="/signIn" className="text-decoration-none">
//                                 <CustomButton
//                                     isLoading={""}
//                                     type={"button"}
//                                     icon={""}
//                                     label={"Sign In"}
//                                     disabled={""}
//                                     width={"161px"}
//                                     height={"57px"}
//                                     backgroundColor={""}
//                                     textColor={"var(--theme-font-color)"}
//                                     shape={""}
//                                     borderStyle={"15px"}
//                                     borderColor={"1px solid var(--theme-font-color)"}
//                                     iconStyle={{ color: "var(--theme-font-color)" }}
//                                     labelStyle={{ fontSize: "16px", fontWeight: "400", textTransform: "capitalize" }}
//                                     hoverEffect={"theme"}
//                                 />
//                             </Link>
//                         </div>
//                     </section>
//                 )
//             ) : (
//                 <Footer />
//             )}
//         </div>
//     );
// };

// export default HeroSection;

const HeroSection = ({ children, className = "", landingPage = true, bottomSection = true, customStyles, backIcon = false }) => {
    const [isSidebarOpen, setIsSidebarOpen] = useState(false);
    const [accessToken] = useLocalStorage("accessToken", "");
    const location = useLocation();
    const excludeMarginRoutes = ["/", "/signIn", "/signUp"];
    const includeHeightRoutes = ["/signIn", "/signUp"];
    const excludeHeaderAndFooterRoutes = ["/signIn", "/signUp"];
    const shouldNotShowHeaderAndFooter = excludeHeaderAndFooterRoutes.includes(location.pathname);
    const shouldApplyMargin = accessToken && !excludeMarginRoutes.includes(location.pathname) && !landingPage;
    const shouldApplyHeight = includeHeightRoutes.includes(location.pathname) && !landingPage;

    const navItems = [
        { label: "Home", icon: <FaHouse />, link: "#" },
        { label: "About Us", icon: <FaCircleInfo />, link: "#" },
        { label: "Our Service", icon: <FaHandshake />, link: "#" },
        { label: "User Guide", icon: <FaBookOpen />, link: "#" },
        { label: "Watch Video", icon: <FaCirclePlay />, link: "#" },
        { label: "Learn More", icon: <FaLightbulb />, link: "/learnMore" },
    ];

    const StickyHeader = () => (
        <section className="stickyHeader px-md-5 px-4">
            <div className="d-flex justify-content-start align-items-center">
                <div className="menu-icon">
                    <Link className="navbar-toggler" onClick={() => setIsSidebarOpen((prev) => !prev)}>
                        <MenuIcon className="showHideMenuImg" alt="Menu Toggle" />
                    </Link>
                </div>
                {backIcon && (
                    <Link className="nav-link ms-3 ms-md-5 me-4 me-md-0" to="/">
                        <BackIcon alt="Back icon" />
                    </Link>
                )}
                <div className="SmartRxTopTxt text-center mx-auto" style={{ paddingRight: backIcon ? "88px" : "30px" }}>
                    SMART RX
                </div>
            </div>

            {isSidebarOpen && (
                <div className="navbar-collapse">
                    <ul className="navbar-nav d-flex flex-wrap mt-3 ms-4">
                        {navItems.map((item, index) => (
                            <li key={index} className="nav-item" style={{ width: "fit-content" }}>
                                <Link className="nav-link d-inline-flex align-items-center gap-2" to={item.link}>
                                    {item.icon} {item.label}
                                </Link>
                            </li>
                        ))}
                    </ul>
                </div>
            )}
        </section>
    );

    const StickyFooter = () => (
        <section className="container stickyFooter">
            <div className="d-flex justify-content-center align-items-center">
                <Link to="/signUp" className="text-decoration-none me-4">
                    <CustomButton
                        label={"Sign Up"}
                        width={"161px"}
                        backgroundColor="#FAF8FA"
                        height={"57px"}
                        textColor={"var(--theme-font-color)"}
                        borderStyle={"15px"}
                        borderColor={"1px solid #AB96D5"}
                        labelStyle={{ fontSize: "16px", fontWeight: "700", textTransform: "capitalize", lineHeight: '96.3%', }}
                        hoverEffect={"theme"}
                    />
                </Link>
                <Link to="/signIn" className="text-decoration-none">
                    <CustomButton
                        label={"Sign In"}
                        width={"161px"}
                        backgroundColor="#FAF8FA"
                        height={"57px"}
                        textColor={"var(--theme-font-color)"}
                        borderStyle={"15px"}
                        borderColor={"1px solid #AB96D5"}
                        labelStyle={{ fontSize: "16px", fontWeight: "700", textTransform: "capitalize", lineHeight: '96.3%' }}
                        hoverEffect={"theme"}
                    />
                </Link>
            </div>
        </section>
    );

    return (
        <>
            <div
                className={`panel panel-default landingTopSection d-flex flex-column ${className} ${isSidebarOpen ? "landing-page-extra-height" : ""}`}
                style={{ height: shouldApplyHeight ? "650px" : "510px" }}
            >
                {/* Header */}
                {!shouldNotShowHeaderAndFooter && accessToken ? <Header /> : <StickyHeader />}

                {/* Hero Content */}
                {landingPage && (
                    <section className="text-center" style={{ marginTop: accessToken ? "5.5rem" : "1.5rem" }}>
                        <div className="hero-image-wrapper mx-auto">
                            <div className="table-background-wrapper mx-1">
                                <div className="text-end">
                                    <div className="me-2 me-md-0">
                                        <div className="main-3 me-4 me-md-0">
                                            <p className="main-3-header ps-2 ps-md-3 pt-1 pt-md-2 pt-lg-3">FileRx Archive</p>
                                            <p className="main-3-body ps-4 ps-md-5 pe-1 pe-md-3">Organize your family Prescription</p>
                                        </div>
                                    </div>
                                </div>
                                <div className="text-start my-5">
                                    <div className="main-3">
                                        <p className="main-3-header ps-2 ps-md-3 pt-1 pe-2 pe-md-3 pt-md-2 pt-lg-3">SmartRx Insights</p>
                                        <p className="main-3-body ps-4 ps-md-5 pe-3 pe-md-3">Look into prescription Smartly</p>
                                    </div>
                                </div>
                                <div className="text-end">
                                    <div className="main-3 me-3">
                                        <p className="main-3-header ps-2 ps-md-3 pe-2 pt-1 pt-md-2 pt-lg-3">SmartRx Health Guide</p>
                                        <p className="main-3-body ps-4 ps-md-5">SmartEdx for Health literacy</p>
                                    </div>
                                </div>
                            </div>
                            <div className="box smart-rx-moto mt-3">Your RX, Our Service</div>
                        </div>
                    </section>
                )}

                {/* Main Content */}
                <div className={`app-padding-bottom flex-grow-1 w-100 ${shouldApplyMargin ? "my-5" : ""}`}>{children}</div>
            </div>
            {/* Footer */}
            {!shouldNotShowHeaderAndFooter ? accessToken ? <Footer /> : bottomSection && <StickyFooter /> : null}
        </>
    );
};

export default HeroSection;

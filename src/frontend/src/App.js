import "./App.css";
import Home from "./components/Home/Home";
import Login from "./components/Login/Login";
import { ToastContainer } from "react-toastify";
import Signup from "./components/Signup/Signup";
import Contact from "./components/Contact/Contact";
import MainLayout from "./pages/MainLayout/MainLayout";
import AvatarExamples from "./components/AvatarExamples";
import Dashboard from "./components/Dashboard/Dashboard";
import LearnMore from "./components/LearnMore/LearnMore";
import Demo from "./components/static/SampleOfHarun/Demo";
import NotFoundPage from "./pages/NotFoundPage/NotFoundPage";
import PreviewPage from "./components/PreviewPage/PreviewPage";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import ErrorBoundary from "./components/static/Commons/ErrorBoundary";
import ProfileDataTable from "./components/Profile/ProfileData";
import ProfilePicture from "./components/Profile/ProfilePicture";
import ProfileDetails from "./components/Profile/ProfileDetails";
import ModalPage from "./components/static/CustomModal/ModalPage";
import ProfileProgress from "./components/Profile/ProfileProgress";
import PrivacyPolicy from "./components/PrivacyPolicy/PrivacyPolicy";
import Autocomplete from "./components/static/Search/AutocompleteSearch";
import RxFilesFoldersList from "./components/BrowseRx/RxFilesFoldersList";
import DashboardAllPatient from "./components/Dashboard/DashboardAllPatient";
import DashboardSinglePatient from "./components/Dashboard/SampleOfAbuBakar";
import LandingPageFooter from "./components/static/Landing/LandingFooterSection";
import CreateNewFolderForSmartRx from "./components/Folder/CreateNewFolderForSmartRx";
import SmartRxInsider from "./components/SmartRxInsider/SmartRxInsider";
import ScrollToTop from "./components/ScrollIntoView/ScrollToTop";
import DrugInformation from "./components/SmartRxInsider/Medicine/DrugInformation";
import About from "./components/About/About";
import GuestRoute from "./routes/GuestRoute";
import ProtectedRoute from "./routes/ProtectedRoute";
import AdviceBlog from "./components/SmartRxInsider/Advice/AdviceBlog";
import DoctorProfile from "./components/SmartRxInsider/DoctorInformation/DoctorProfile/DoctorProfile";
import PatientPrescriptionList from "./components/BrowseRx/PatientPrescriptionList";
import PatientProfileList from "./components/BrowseRx/PatientProfileList";
import SwitchPatient from "./components/Dashboard/SwitchPatient";
import SinglePatient from "./components/Dashboard/SinglePatient";
import DoctorProfileList from "./components/BrowseRx/DoctorProfileList";
import PatientVitalList from "./components/BrowseRx/PatientVitalList";
import LastVital from "./components/BrowseRx/AllPatientVitals";
import AllPatientVitals from "./components/BrowseRx/AllPatientVitals";
import AddNewpatient from "./components/BrowseRx/AddNewpatient";

const profileData = {
    picture: "../img/profilepic.png",
    name: "Harun",
    progress: 75,
    data: [
        { field: "First Name", value: "Harun" },
        { field: "Last Name", value: "Rashid" },
        { field: "Nick Name", value: "Liton" },
        { field: "Phone Number", value: "01710455190" },
        { field: "Email", value: "harun@demo.com" },
        { field: "Date of Birth", value: "09-09-2009" },
        { field: "Occupation", value: "Business" },
    ],
};

const ProfilePage = () => <ProfileDetails profile={profileData} />;
const ProfilePicPage = () => <ProfilePicture profile={profileData} />;
const ProfileProgPage = () => <ProfileProgress profile={profileData} />;
const ProfileDataPage = () => <ProfileDataTable profile={profileData} />;

function App() {
    return (
        <BrowserRouter>
            {/* <ScrollToTop /> */}
            <ErrorBoundary>
                <Routes>
                    {/* Route for the login page */}
                    <Route
                        caseSensitive
                        path="/"
                        element={
                            <GuestRoute>
                                <Home />
                            </GuestRoute>
                        }
                    />
                    <Route
                        caseSensitive
                        path="/signIn"
                        element={
                            <GuestRoute>
                                <Login />
                            </GuestRoute>
                        }
                    />
                    <Route
                        caseSensitive
                        path="/signUp"
                        element={
                            <GuestRoute>
                                <Signup />
                            </GuestRoute>
                        }
                    />
                    <Route
                        caseSensitive
                        path="/learnmore/:type"
                        element={<LearnMore />}
                    />
                    <Route
                        caseSensitive
                        path="/privacypolicy"
                        element={<PrivacyPolicy />}
                    />
                    <Route
                        caseSensitive
                        path="/druginfo"
                        element={<DrugInformation />}
                    />
                    <Route caseSensitive path="/about" element={<About />} />

                    {/* Route for the main application layout with Sidebar and Navbar */}
                    <Route caseSensitive element={<MainLayout />}>
                        {/* Nested route for the dashboard */}
                        <Route
                            caseSensitive
                            path="/demo"
                            element={
                                <ProtectedRoute>
                                    <Demo />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/blog"
                            element={
                                <ProtectedRoute>
                                    <AdviceBlog />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/contact"
                            element={
                                <ProtectedRoute>
                                    <Contact />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/dashboard"
                            element={
                                <ProtectedRoute>
                                    <Dashboard />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/preview"
                            element={
                                <ProtectedRoute>
                                    <PreviewPage />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/modalPage"
                            element={
                                <ProtectedRoute>
                                    <ModalPage />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/autocomplete"
                            element={
                                <ProtectedRoute>
                                    <Autocomplete />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/profileDetails"
                            element={
                                <ProtectedRoute>
                                    <ProfilePage />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            path="/browserx/folder/:folderId"
                            element={
                                <ProtectedRoute>
                                    <RxFilesFoldersList />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            path="/browserx/:patientId/*"
                            element={
                                <ProtectedRoute>
                                    <RxFilesFoldersList />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            path="/browserx/*"
                            element={
                                <ProtectedRoute>
                                    <RxFilesFoldersList />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            path="/patientProfile"
                            element={
                                <ProtectedRoute>
                                    <PatientProfileList />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            path="/addPatient"
                            element={
                                <ProtectedRoute>
                                    <AddNewpatient />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            path="/patientVitalList"
                            element={
                                <ProtectedRoute>
                                    <PatientVitalList />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            path="/patientVitals"
                            element={
                                <ProtectedRoute>
                                    <AllPatientVitals />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            path="/doctorProfile"
                            element={
                                <ProtectedRoute>
                                    <DoctorProfile />
                                </ProtectedRoute>
                            }
                        />
                         <Route
                            path="/doctorlist"
                            element={
                                <ProtectedRoute>
                                    <DoctorProfileList />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            path="/browse-rx/:type"
                            element={
                                <ProtectedRoute>
                                    <PatientPrescriptionList />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/avatarExamples"
                            element={
                                <ProtectedRoute>
                                    <AvatarExamples />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/profilePicture"
                            element={
                                <ProtectedRoute>
                                    <ProfilePicPage />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/ProfileProgress"
                            element={
                                <ProtectedRoute>
                                    <ProfileProgPage />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/all-patient"
                            element={
                                <ProtectedRoute>
                                    <DashboardAllPatient />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/switch-patient"
                            element={
                                <ProtectedRoute>
                                    <SwitchPatient />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/profileDataTable"
                            element={
                                <ProtectedRoute>
                                    <ProfileDataPage />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/landingPageFooter"
                            element={
                                <ProtectedRoute>
                                    <LandingPageFooter />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/single-patient/:patientId"
                            element={
                                <ProtectedRoute>
                                    <SinglePatient />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/createNewFolder"
                            element={
                                <ProtectedRoute>
                                    <CreateNewFolderForSmartRx />
                                </ProtectedRoute>
                            }
                        />
                        <Route
                            caseSensitive
                            path="/smartRxInsider"
                            element={
                                <ProtectedRoute>
                                    <SmartRxInsider />
                                </ProtectedRoute>
                            }
                        />
                    </Route>
                    {/* 404 fallback */}
                    <Route caseSensitive path="*" element={<NotFoundPage />} />
                </Routes>
            </ErrorBoundary>

            <ToastContainer
                position="top-right"
                autoClose={3000}
                hideProgressBar={false}
                newestOnTop={false}
                closeOnClick
                rtl={false}
                pauseOnFocusLoss
                draggable
                pauseOnHover
                toastClassName="responsive-toast"
            />
        </BrowserRouter>
    );
}

export default App;

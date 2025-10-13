import "./SinglePatient.css";
import Card from "./DashboardCard";
import React, { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import MyPieChart from "../static/Charts/MyPieChart";
import doctorIcon from "../../assets/img/Doctor.svg";
import folderIcon from "../../assets/img/Folder.svg";
import vitalsIcon from "../../assets/img/Vitals.svg";
import PatientVitalList from "../BrowseRx/PatientVitalList";
import { useUserContext } from "../../contexts/UserContext";
import PageTitle from "../static/PageTitle/PageTitle";
import MyDonutChart from "../static/Charts/MyDonutChart";
import useSmartNavigate from "../../hooks/useSmartNavigate";
import useApiClients from "../../services/useApiClients";
import ProfileProgress from "../Profile/ProfileProgress";
import ProfilePicture from "../Profile/ProfilePicture";
import { useLocation } from "react-router-dom";
import DefaultProfilePhoto from "../../assets/img/DefaultProfilePhoto.svg";


const SinglePatient = () => {
    const { patientId } = useParams();
    const { api } = useApiClients();
    const { user } = useUserContext();
    const { smartNavigate } = useSmartNavigate({ scroll: "top" });
    const [patient, setPatient] = useState(null);

    useEffect(() => {
        const fetchPatient = async () => {
            try {
                if (patientId) {
                    const res = await api.getPatientDataById({ patientId });
                    setPatient(res?.data);
                }
            } catch (error) {
                console.error("Error fetching patient:", error);
            }
        };
        fetchPatient();
    }, [patientId]);
    // console.log("single patient:", patientId);
    const fullName = patient
        ? `${patient.firstName || ''} ${patient.lastName || ''} ${patient.nickName || ''}`.trim()
        : "Loading...";
    const progress = patient?.profileProgress ?? 0;
    const defaultData = [
        { name: "Doctor", value: 10 },
        { name: "Medicine", value: 20 },
        { name: "Lab", value: 30 },
        { name: "Transport", value: 200 },
        { name: "Others", value: 100 },
    ];
    const location = useLocation();
    const coloredName = location.state?.coloredName;
    const colorForDefaultName = location.state?.colorForDefaultName;

    return (
        <div className="col-12 col-md-7 mx-auto ">
            <PageTitle
                backButton={true}
                pageName={fullName}
                switchButton={true}
                noMargin={true}
                showProfilePicture={true}
                isSinglePatientView={true}
                progressData={progress}
                patientData={patient}
                profileData={{
                    profilePhotoPath: patient?.profilePhotoPath || DefaultProfilePhoto,
                    picture: patient?.profilePhotoPath || DefaultProfilePhoto,
                    coloredName: coloredName || (patient ? `${patient.firstName?.charAt(0) || 'P'}` : 'P'),
                    colorForDefaultName: colorForDefaultName || "#e6e4ef",
                }}
            ></PageTitle>
            <div className="container chart-section">
                <div className="row g-3">
                    <div className="col-6 col-lg-6 col-md-6">
                        <div className="chart-container d-flex justify-content-center">
                            <MyDonutChart />
                        </div>
                    </div>
                    <div className="col-6 col-lg-6 col-md-6">
                        <div className="chart-container d-flex justify-content-center">
                            <MyPieChart data={defaultData} />
                        </div>
                    </div>
                </div>
            </div>

            <div className="container card-container">
                <div className="row">
                    <div className="col-6">
                        <div
                            role="button"
                            className="d-flex justify-content-center"
                        >
                            <div
                                style={{
                                    width: "100%",
                                    aspectRatio: "1 / 1",
                                }}
                                onClick={() => smartNavigate(`/browserx/${patientId}`)}
                            >
                                <Card
                                    logo={folderIcon}
                                    title="Browse Rx/SRx"
                                    count={12}
                                    bgColor="#B1AACF"
                                    color="var(--text-white)"
                                    fontSize="15px"
                                    titleBottomPosition="4px"
                                />
                            </div>
                        </div>
                    </div>
                    <div className="col-6 vital-list">
                         <div className="d-flex justify-content-center">
                            <Link
                                to="/patientVitalList"
                               state={{ userId: Number(user?.jti), patientId }}
                                style={{
                                    width: "100%",
                                    aspectRatio: "1 / 1",
                                }}
                            >
                                <Card
                                    logo={vitalsIcon}
                                    title="Vitals"
                                    count={15}
                                    bgColor="#E6E4EF"
                                    color="var(--theme-font-color)"
                                    fontSize="15px"
                                    titleBottomPosition="4px"
                                />
                            </Link>
                        </div>                        
                    </div>
                </div>

                <div className="row my-3">
                    <div className="col-6">
                        <div className="d-flex justify-content-center">
                            <Link
                                to="/doctorlist"
                                state={{ userId: Number(user?.jti), patientId }}
                                style={{
                                    width: "100%",
                                    aspectRatio: "1 / 1",
                                }}
                            >
                                <Card
                                    logo={doctorIcon}
                                    title="Doctor"
                                    count={15}
                                    bgColor="#E6E4EF"
                                    color="var(--theme-font-color)"
                                    fontSize="15px"
                                    titleBottomPosition="4px"
                                />
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default SinglePatient;

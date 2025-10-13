import "./AllPatient.css";
import Card from "./DashboardCard";
import { Link } from "react-router-dom";
import MyPieChart from "../static/Charts/MyPieChart";
import doctorIcon from "../../assets/img/Doctor.svg";
import folderIcon from "../../assets/img/Folder.svg";
import vitalsIcon from "../../assets/img/Vitals.svg";
import PageTitle from "../static/PageTitle/PageTitle";
import MyDonutChart from "../static/Charts/MyDonutChart";
import useSmartNavigate from "../../hooks/useSmartNavigate";
import patientProfileIcon from "../../assets/img/PatientProfileIcon.svg";
import { useState, useEffect, useMemo } from "react";
import useApiService from "../../services/useApiService";
import { useUserContext } from "../../contexts/UserContext";
import { DASHBOARD_SUMMARY_URL } from "../../constants/apiEndpoints";

const AllPatient = () => {
    const { smartNavigate } = useSmartNavigate({ scroll: "top" });
    const { user } = useUserContext();
    const { getWithParams } = useApiService();

    // State for dashboard data
    const [dashboardData, setDashboardData] = useState({
        userSummary: null,
        expenseSummary: null
    });
    const [isLoading, setIsLoading] = useState(true);
    const [error, setError] = useState(null);

    // Create a stable userId value to prevent dependency array issues
    const userId = useMemo(() => user?.jti || 0, [user?.jti]);
    // Fetch dashboard summary data
    useEffect(() => {
        const fetchDashboardData = async () => {
            try {
                setIsLoading(true);
                setError(null);

                const response = await getWithParams(DASHBOARD_SUMMARY_URL, {
                    userId: userId
                });
                if (response) {
                    // Handle different response structures
                    const responseData = response.data || response;

                    setDashboardData({
                        userSummary: responseData.userSummary || null,
                        expenseSummary: responseData.expenseSummary
                            ? responseData.expenseSummary
                            : null
                    });
                }
            } catch (err) {
                console.error("Error fetching dashboard data:", err);
                setError("Failed to load dashboard data");
            } finally {
                setIsLoading(false);
            }
        };

        // Always fetch data, regardless of user state
        fetchDashboardData();
    }, [userId]);

    // Default expense data for pie chart fallback
    const defaultExpenseData = [
        { name: "Doctor", value: 0 },
        { name: "Medicine", value: 0 },
        { name: "Lab", value: 0 },
        { name: "Transport", value: 0 },
        { name: "Others", value: 0 },
    ];

    // Use API data if available, otherwise use default
    // Convert object to array format for pie chart
    const expenseData = (() => {
        if (dashboardData.expenseSummary && typeof dashboardData.expenseSummary === 'object') {

            // If it's an object, convert to array format
            if (Array.isArray(dashboardData.expenseSummary)) {

                return dashboardData.expenseSummary;
            } else {

                // Convert object to array format
                return [
                    { name: "Doctor", value: dashboardData.expenseSummary.totalDoctors || 0 },
                    { name: "Medicine", value: dashboardData.expenseSummary.totalMedicines || 0 },
                    { name: "Lab", value: dashboardData.expenseSummary.totalTests || 0 },
                    { name: "Transport", value: dashboardData.expenseSummary.totalTransportCost || 0 },
                    { name: "Others", value: dashboardData.expenseSummary.totalOtherCosts || 0 }
                ];
            }
        }
        return defaultExpenseData;
    })();
    const userSummary = dashboardData.userSummary;

    return (
        <>
            <div className="col-12 col-md-7 mx-auto ">
                <PageTitle
                    backButton={false}
                    pageName={"All Patient"}
                    switchButton={true}
                />
                <div className="container chart-section">
                    {isLoading && (
                        <div className="text-center py-4">
                            <div className="spinner-border text-primary" role="status">
                                <span className="visually-hidden">Loading...</span>
                            </div>
                            <p className="mt-2">Loading dashboard data...</p>
                        </div>
                    )}

                    {error && (
                        <div className="alert alert-danger text-center" role="alert">
                            {error}
                        </div>
                    )}

                    {!isLoading && !error && (
                        <div className="row g-3">
                            <div className="col-6 col-lg-6 col-md-6">
                                <div className="chart-container d-flex justify-content-center" style={{ height: '100%', minHeight: '250px' }}>
                                    <MyDonutChart
                                        userSummary={userSummary}
                                        width="100%"
                                        height="100%"
                                        cx="50%"
                                        cy="50%"
                                    />
                                </div>
                            </div>
                            <div className="col-6 col-lg-6 col-md-6">
                                <div className="chart-container d-flex justify-content-center" style={{ height: '100%', minHeight: '250px' }}>
                                    <MyPieChart
                                        data={expenseData}
                                        width="100%"
                                        height="100%"
                                        innerRadius="35%"
                                        outerRadius="73%"
                                        cx="50%"
                                        cy="50%"
                                    />
                                </div>
                            </div>
                        </div>
                    )}
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
                                    onClick={() => smartNavigate("/browserx")}
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
                        <div className="col-6">
                            <div className="d-flex justify-content-center">
                                <Link
                                    to="/patientVitalList"
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
                                    to="/patientProfile"
                                    style={{
                                        width: "100%",
                                        aspectRatio: "1 / 1",
                                    }}
                                >
                                    <Card
                                        logo={patientProfileIcon}
                                        title="All Patient's List"
                                        count={12}
                                        bgColor="#E6E4EF"
                                        color="var(--theme-font-color)"
                                        fontSize="15px"
                                        titleBottomPosition="4px"
                                    />
                                </Link>
                            </div>
                        </div>
                        <div className="col-6">
                            <div className="d-flex justify-content-center">
                                <Link
                                    to="/doctorlist"
                                    state={{ userId: Number(user?.jti) || 0, patientId: null }}
                                    style={{
                                        width: "100%",
                                        aspectRatio: "1 / 1",
                                    }}
                                >
                                    <Card
                                        logo={doctorIcon}
                                        title="Doctor Profile"
                                        count={15}
                                        bgColor="#B1AACF"
                                        color="var(--text-white)"
                                        titleBottomPosition="4px"
                                    />
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
};

export default AllPatient;

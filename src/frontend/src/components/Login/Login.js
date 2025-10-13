/**
 * Login Component
 * Handles login with OTP and password for a mobile number-based auth system.
 * Securely validates input, manages token-based auth, and provides feedback to users.
 */

import React, { useState } from "react";
import "./Login.css";
import { jwtDecode } from "jwt-decode";
import { Link } from "react-router-dom";
import { FcGoogle } from "react-icons/fc";
import { FaMobileAlt } from "react-icons/fa";
import { TbLockPassword } from "react-icons/tb";
import HeroSection from "../HeroSection/HeroSection";
import { validateField } from "../../utils/validators";
import CustomCheck from "../static/Commons/CustomCheck";
import useFormHandler from "../../hooks/useFormHandler";
import CustomInput from "../static/Commons/CustomInput";
import useToastMessage from "../../hooks/useToastMessage";
import CustomButton from "../static/Commons/CustomButton";
import useAuthService from "../../services/useAuthService";
import useSmartNavigate from "../../hooks/useSmartNavigate";
import { useUserContext } from "../../contexts/UserContext";
import { useLocalStorage } from "../../hooks/useLocalStorage";
import { LOGIN_URL, OTP_VERIFICATION_URL } from "../../constants/apiEndpoints";

const Login = () => {
    const showToast = useToastMessage();
    const { decodeToken } = useUserContext();
    const { signIn, verifyOtp } = useAuthService();
    const { handleInputChange, togglePasswordVisibility } = useFormHandler();
    const { smartNavigate, navigateBack, navigateForward } = useSmartNavigate({ scroll: "top" });

    const [showPassword, setShowPassword] = useState(false);

    const [, setAccessToken] = useLocalStorage("accessToken", "");
    const [, setRefreshToken] = useLocalStorage("refreshToken", "");
    const [, setAccessPermissions] = useLocalStorage("accessPermissions", []);

    const initialData = {
        Otp: "",
        UserId: "",
        AuthType: 2,
        UserName: "",
        Password: "",
        rememberMe: false,
    };

    const [isOtpSent, setIsOtpSent] = useState(false);
    const [isLoading, setIsLoading] = useState(false);
    const [formData, setFormData] = useState(initialData);
    const [fieldErrors, setFieldErrors] = useState(initialData);
    const [isGoogleLoading, setIsGoogleLoading] = useState(false);
    const [userPrimaryFolder, setUserPrimaryFolder] = useState({
        id: "",
        folderName: "",
        description: "",
        folderHierarchy: "",
        parentFolderId: "",
        patientProfileId: "",
        userId: "",
        createdDate: "",
        createdById: "",
    });

    /**
     * Handles OTP request submission
     */
    const handleOtpSend = async (e) => {
        e.preventDefault();
        const fieldsToValidate = {
            UserName: validateField("UserName", formData.UserName, "Mobile number"),
        };

        if (Object.values(fieldsToValidate).some((error) => error)) {
            setFieldErrors(fieldsToValidate);
            return;
        }

        try {
            setIsLoading(true);
            const response = await signIn(LOGIN_URL, formData);

            if (response?.message === "Successful") {
                setIsOtpSent(true);
                const decodedToken = jwtDecode(response.response.accessToken);

                if (decodedToken.sub === "AUTHENTICATION") {
                    // const userPrimaryFolder=response.response.userPrimaryFolder;
                    setFormData((prev) => ({
                        ...prev,
                        UserId: response.response.userId,
                        // Otp: response.response.otp,
                    }));
                    showToast("success", "OTP sent to your mobile number", "👋");
                } else {
                    showToast("error", "User not found", "");
                }
            }
        } catch (error) {
            console.error("Error sending OTP:", error);
            showToast("error", "Failed to send OTP. Please try again.", "⚠️");
        } finally {
            setIsLoading(false);
        }
    };

    /**
     * Handles OTP verification and final login
     */
    const handleSubmit = async (e) => {
        e.preventDefault();

        const fieldsToValidate = {
            UserName: validateField("UserName", formData.UserName, "Mobile Number"),
            Password: validateField("Password", formData.Password, "Password", true),
        };

        if (Object.values(fieldsToValidate).some((error) => error)) {
            setFieldErrors(fieldsToValidate);
            return;
        }

        try {
            setIsLoading(true);

            const newData = {
                ...formData,
                Otp: formData.Password,
            };

            const response = await verifyOtp(OTP_VERIFICATION_URL, newData);

            if (response?.message === "Successful" && response.response?.accessToken) {
                const decodedToken = jwtDecode(response.response.accessToken);
                const folder = response.response.userPrimaryFolder;
                setUserPrimaryFolder(response.response.userPrimaryFolder);

                if (decodedToken.sub === "AUTHENTICATION") {
                    const message = `Welcome back ${decodedToken.FirstName || "User"} ${decodedToken.LastName || ""}!`;
                    decodeToken(response.response.accessToken);
                    setAccessToken(response.response.accessToken);
                    setRefreshToken(response.response.refreshToken);
                    setAccessPermissions(decodedToken.role);

                    response.response.isExistAnyFile
                        ? smartNavigate("/all-patient")
                        : smartNavigate("/dashboard");

                    setTimeout(() => showToast("success", message, "👋"), 100);
                } else {
                    smartNavigate("/signIn");
                }
            }
            // else {
            //     showToast("error", "Invalid login attempt", "⚠️");
            // }
        } catch (error) {
            console.error("Error verifying OTP:", error);
            showToast("error", "Login failed. Please try again.", "⚠️");
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <div className="container px-0">
            <HeroSection bottomSection={false} backIcon={true} landingPage={false}>
                <div className="signin-container">
                    <div className="signin-header">
                        <h4>Sign In</h4>
                    </div>
                    <div className="signin-box">
                        <form onSubmit={isOtpSent ? handleSubmit : handleOtpSend}>
                            <div className="signin-body">
                                <CustomInput
                                    className="input-style"
                                    name="UserName"
                                    type="text"
                                    placeholder="Mobile No."
                                    value={formData.UserName}
                                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "mobileNo", "Mobile number")}
                                    error={fieldErrors.UserName}
                                    disabled={isLoading}
                                    icon={<FaMobileAlt />}
                                    iconPosition="left"
                                    minHeight="0px"
                                />
                                {isOtpSent && (
                                    <>
                                        <CustomInput
                                            className="input-style"
                                            name="Password"
                                            type="password"
                                            placeholder="Pin"
                                            value={formData.Password}
                                            onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "input", "Password")}
                                            error={fieldErrors.Password}
                                            disabled={isLoading}
                                            icon={<TbLockPassword />}
                                            iconPosition="left"
                                            minHeight="0px"
                                        />
                                        <CustomCheck
                                            label="Remember Me"
                                            name="rememberMe"
                                            value={formData.rememberMe}
                                            onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "check", "rememberMe")}
                                            disabled={isLoading}
                                        />
                                    </>
                                )}

                                <div className="d-flex justify-content-start w-100">
                                    <CustomButton
                                        isLoading={isLoading}
                                        type="submit"
                                        label={isOtpSent ? "Verify PIN" : "Sign In"}
                                        disabled={isLoading}
                                        width="100%"
                                        textColor="var(--theme-font-color)"
                                        shape="roundedSquare"
                                        borderColor="1px solid var(--theme-font-color)"
                                        labelStyle={{ fontSize: "16px", fontWeight: "400", fontFamily: "Georama", textTransform: "capitalize" }}
                                        hoverEffect="theme"
                                    />
                                </div>

                                {!isOtpSent && (
                                    <>
                                        <div className="or-divider">
                                            <span className="divider-line"></span>
                                            <span className="text">or</span>
                                            <span className="divider-line"></span>
                                        </div>
                                        <div className="d-flex justify-content-center w-100">
                                            <CustomButton
                                                isLoading={isGoogleLoading}
                                                type="button"
                                                icon={<FcGoogle size={20} />}
                                                label="Google Sign-in"
                                                disabled={isGoogleLoading || isLoading}
                                                width="100%"
                                                textColor="var(--theme-font-color)"
                                                shape="roundedSquare"
                                                borderColor="1px solid var(--theme-font-color)"
                                                labelStyle={{ fontSize: "16px", fontWeight: "400", fontFamily: "Georama", textTransform: "capitalize" }}
                                                hoverEffect="theme"
                                            />
                                        </div>
                                    </>
                                )}
                            </div>
                        </form>

                        <div className="signin-footer">
                            {isOtpSent ? (
                                <p>
                                    Didn't get your verification code?{" "}
                                    <Link to="#" className="link">
                                        Click here
                                    </Link>{" "}
                                    to resend.
                                </p>
                            ) : (
                                <>
                                    <Link to="#">Forgot password?</Link>
                                    <Link to="/signUp">Create new account</Link>
                                </>
                            )}
                        </div>
                    </div>
                </div>
            </HeroSection>
        </div>
    );
};

export default Login;

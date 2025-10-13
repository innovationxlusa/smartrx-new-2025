import React, { useState } from "react";
import "./Signup.css";
import { TbLockPassword } from "react-icons/tb";
import HeroSection from "../HeroSection/HeroSection";
import { validateField } from "../../utils/validators";
import useFormHandler from "../../hooks/useFormHandler";
import CustomCheck from "../static/Commons/CustomCheck";
import CustomInput from "../static/Commons/CustomInput";
import CustomButton from "../static/Commons/CustomButton";
import useToastMessage from "../../hooks/useToastMessage";
import CustomSelect from "../static/Dropdown/CustomSelect";
import useAuthService from "../../services/useAuthService";
import useSmartNavigate from "../../hooks/useSmartNavigate";
import { useUserContext } from "../../contexts/UserContext";
import { USER_REGISTER_URL } from "../../constants/apiEndpoints";
import { FaMobileAlt, FaCalendarAlt, FaTransgender } from "react-icons/fa";
import { FaRegUser } from "react-icons/fa6";

const Signup = () => {
    const { serializeFormData, handleInputChange } = useFormHandler();

    const { signup } = useAuthService();

    const showToast = useToastMessage();
    const { decodeToken } = useUserContext();
    const { smartNavigate, navigateBack, navigateForward } = useSmartNavigate({ scroll: "top" });

    const initialData = {
        agree: "",
        // Gender: "",
        UserName: "",
        LastName: "",
        MobileNo: "",
        password: "",
        FirstName: "",
        // DateOfBirth: "",
        confirmPassword: "",
    };

    // State to manage loading status
    const [isLoading, setIsLoading] = useState(false);

    // State to manage form data
    const [formData, setFormData] = useState(initialData);

    // State to manage individual field errors
    const [fieldErrors, setFieldErrors] = useState(initialData);

    const handleSubmit = async (e) => {
        e.preventDefault();

        const fieldsToValidate = {
            MobileNo: validateField("MobileNo", formData.MobileNo, "Mobile number"),
            FirstName: validateField("FirstName", formData.FirstName, "First name"),
            LastName: validateField("LastName", formData.LastName, "Last name"),
            // Gender: validateField("Gender", formData.Gender, "Gender"),
            // DateOfBirth: validateField("DateOfBirth", formData.DateOfBirth, "Date of birth"),
            password: validateField("password", formData.password, "Password", true),
            confirmPassword: validateField("confirmPassword", { password: formData.password, confirmPassword: formData.confirmPassword }, "Confirm password"),
            agree: validateField("privacyPolicy", formData.agree, "You must agree to the Privacy Policy."),
        };

        if (Object.values(fieldsToValidate).some((error) => error !== "")) {
            setFieldErrors(fieldsToValidate);
            return;
        }

        try {
            setIsLoading(true);
            const serializedData = serializeFormData(e.target);
            const newData = {
                ...serializedData,
                UserName: formData.MobileNo,
            };

            const response = await signup(USER_REGISTER_URL, newData);

            if (response && response.message === "Successful") {
                const message = `Registration Successful`;
                smartNavigate("/signIn");
                setTimeout(() => {
                    showToast("success", message, "🎉");
                }, 300);
            }
        } catch (error) {
            console.error("Error submitting form:", error);
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <div className="container px-0">
            <HeroSection bottomSection={false} backIcon={true} landingPage={false} backgroundHeight={"140px"}>
                <div className="signup-container">
                    <div className="signup-header">
                        <h4>Sign Up</h4>
                    </div>
                    <div className="signup-box">
                        <form onSubmit={handleSubmit} className="">
                            <div className="signup-body">
                                <CustomInput
                                    className="input-style"
                                    label=""
                                    labelPosition="top-left"
                                    name="FirstName"
                                    type="text"
                                    placeholder="First Name"
                                    value={formData.FirstName}
                                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "input", "First Name")}
                                    error={fieldErrors.FirstName}
                                    disabled={isLoading}
                                    icon={<FaRegUser />}
                                    iconPosition={"left"}
                                    minHeight={"0px"}
                                />

                                <CustomInput
                                    className="input-style"
                                    label=""
                                    labelPosition="top-left"
                                    name="LastName"
                                    type="text"
                                    placeholder="Last Name"
                                    value={formData.LastName}
                                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "input", "Last Name")}
                                    error={fieldErrors.LastName}
                                    disabled={isLoading}
                                    icon={<FaRegUser />}
                                    iconPosition={"left"}
                                    minHeight={"0px"}
                                />

                                <CustomInput
                                    className="input-style"
                                    label=""
                                    labelPosition="top-left"
                                    name="MobileNo"
                                    type="tel"
                                    placeholder="Mobile No."
                                    value={formData.MobileNo}
                                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "mobileNo", "Mobile number")}
                                    error={fieldErrors.MobileNo}
                                    disabled={isLoading}
                                    icon={<FaMobileAlt />}
                                    iconPosition={"left"}
                                    minHeight={"0px"}
                                />
                                {/* <CustomSelect
                                    name="Gender"
                                    value={formData.Gender}
                                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "select", "Gender")}
                                    options={[
                                        { label: "--Select Gender--", value: "" },
                                        { label: "Male", value: "1" },
                                        { label: "Female", value: "2" },
                                    ]}
                                    placeholder="Select Gender"
                                    icon={<FaTransgender />}
                                    bgColor="#E6E4EF"
                                    textColor=""
                                    borderRadius="5px"
                                    width="100%"
                                    error={fieldErrors.Gender}
                                /> */}

                                {/* <CustomInput
                                    className="input-style"
                                    label=""
                                    labelPosition="top-left"
                                    name="DateOfBirth"
                                    type="date"
                                    placeholder="dd/mm/yyyy"
                                    value={formData.DateOfBirth}
                                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "date", "DateOfBirth")}
                                    error={fieldErrors.DateOfBirth}
                                    disabled={isLoading}
                                    icon={<FaCalendarAlt />}
                                    iconPosition={"left"}
                                    minHeight={"0px"}
                                /> */}

                                <CustomInput
                                    className="input-style"
                                    label=""
                                    labelPosition="top-left"
                                    name="password"
                                    type="password"
                                    placeholder="Password"
                                    value={formData.password.replace(/\//g, "-")}
                                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "password", "Password")}
                                    error={fieldErrors.password}
                                    disabled={isLoading}
                                    icon={<TbLockPassword />}
                                    iconPosition={"left"}
                                    minHeight={"0px"}
                                />

                                <CustomInput
                                    className="input-style"
                                    label=""
                                    labelPosition="top-left"
                                    name="confirmPassword"
                                    type="password"
                                    placeholder="Confirm Password"
                                    value={formData.confirmPassword}
                                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "confirmPassword", "Confirm Password")}
                                    error={fieldErrors.confirmPassword}
                                    disabled={isLoading}
                                    icon={<TbLockPassword />}
                                    iconPosition={"left"}
                                    minHeight={"0px"}
                                />

                                <CustomCheck
                                    label="I agree with the"
                                    name="agree"
                                    value={formData.agree}
                                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "check", "agree")}
                                    error={fieldErrors.agree}
                                    disabled={isLoading}
                                    linkSection="Privacy Policy"
                                />

                                <div className="d-flex justify-content-start w-100">
                                    <CustomButton
                                        isLoading={isLoading}
                                        type={"submit"}
                                        icon={""}
                                        label={"Create Account"}
                                        disabled={isLoading}
                                        width={"100%"}
                                        backgroundColor={""}
                                        textColor={"var(--theme-font-color)"}
                                        shape={"roundedSquare"}
                                        borderStyle={""}
                                        borderColor={"1px solid var(--theme-font-color)"}
                                        iconStyle={{ color: "var(--theme-font-color)" }}
                                        labelStyle={{ fontSize: "16px", fontWeight: "400", fontFamily: "Georama", textTransform: "capitalize" }}
                                        hoverEffect={"theme"}
                                    />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </HeroSection>
        </div>
    );
};

export default Signup;

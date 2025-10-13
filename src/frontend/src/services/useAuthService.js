import { useUserContext } from "../contexts/UserContext"; // Import UserContext to access user-related data
import useApiServiceCall from "../hooks/useApiServiceCall"; // Custom hook for API call

/**
 * Custom hook that provides authentication-related services such as signup, sign-in, getOtpInSignup, getOtpInLogin, verifyOtp, token refresh, and logout.
 * @returns {object} - Object containing signIn, refreshAccessToken, and logout methods.
 */
const useAuthService = () => {
    const { isLoggedIn } = useUserContext; // Access user context to check if user is logged in and to update login state
    const { executeApiCall } = useApiServiceCall();

    /**
     * Handles user signup.
     * @param {string} endpoint - API endpoint for signup.
     * @param {object} payload - Data to be sent to the API.
     * @returns {Promise} - API response.
     */
    const signup = (endpoint, payload) => {
        return executeApiCall(endpoint, "POST", false, payload)
            .then((response) => response)
            .catch((error) => console.error("Signup failed:", error));
    };

    /**
     * Handles user sign-in.
     * @param {string} endpoint - API endpoint for sign-in.
     * @param {object} payload - Data to be sent to the API.
     * @returns {Promise} - API response.
     */
    const signIn = (endpoint, payload) => {
        return executeApiCall(endpoint, "POST", false, payload)
            .then((response) => response)
            .catch((error) => console.error("Sign-in failed:", error));
    };

    /**
     * Retrieves OTP for signup.
     * @param {string} endpoint - API endpoint to get OTP.
     * @returns {Promise} - API response.
     */
    const getOtpInSignup = async (endpoint) => {
        return executeApiCall(endpoint, "GET", true)
            .then((response) => response)
            .catch((error) => console.error("Failed to get OTP in signup:", error));
    };

    /**
     * Retrieves OTP for login.
     * @param {string} endpoint - API endpoint to get OTP.
     * @returns {Promise} - API response.
     */
    const getOtpInLogin = async (endpoint) => {
        if (isLoggedIn) return;
        return executeApiCall(endpoint, "GET", true)
            .then((response) => response)
            .catch((error) => console.error("Failed to get OTP in login:", error));
    };

    /**
     * Verifies OTP for user authentication.
     * @param {string} otp - OTP entered by the user.
     * @param {string} phone - Phone number of the user.
     * @param {string} endpoint - API endpoint to verify OTP.
     * @returns {Promise} - API response.
     */
    const verifyOtp = (endpoint, payload) => {
        // if (!accessToken) return;
        return executeApiCall(endpoint, "POST", false, payload)
            .then((response) => response)
            .catch((error) => console.error("OTP verification failed:", error));
    };

    return { signup, signIn, getOtpInSignup, getOtpInLogin, verifyOtp };
};

export default useAuthService;

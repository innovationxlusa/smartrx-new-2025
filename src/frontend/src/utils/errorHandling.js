/**
 * Custom error handling utility functions.
 */

/**
 * Detects if the error is related to CORS (Cross-Origin Resource Sharing).
 * @param {Error} error - The error object to check.
 * @returns {boolean} - True if it's a CORS-related error.
 */
export const isCorsError = (error) => {
    console.log(error);
    return (
        !error.response &&
        error.message &&
        (error.message.includes("CORS") ||
            error.message.includes("Network Error") ||
            error.message.includes("cross-origin") ||
            error.message.includes("request did not succeed"))
    );
};

/**
 * General error handler to handle different types of errors.
 * @param {Error} error - The error object to handle.
 * @param {Function} [setError] - Optional state setter to update the error state.
 * @param {Function} [showToast] - Optional function to display toast notifications.
 */
export const handleGeneralError = (
    error,
    setError = null,
    showToast = null
) => {
    let errorMessage = "An unknown error occurred.";

    if (error.response) {
        console.log(error.response.data.message);
        // Server responded with a status code outside the 2xx range.
        switch (error.response.status) {
            case 400:
                errorMessage =
                    error?.response?.data?.message ||
                    "Bad Request. Please check your input.";
                break;
            case 401:
                errorMessage =
                    error?.response?.data?.message ||
                    "Unauthorized. Please log in.";
                break;
            case 403:
                errorMessage =
                    error?.response?.data?.message ||
                    "Forbidden. You do not have permission to perform this action.";
                break;
            case 404:
                errorMessage =
                    error?.response?.data?.message ||
                    "Not Found. The requested resource could not be found.";
                break;
            case 409:
                errorMessage =
                    error?.response?.data?.message ||
                    "The data already exists. Please try with different information.";
                break;
            case 500:
                errorMessage =
                    error?.response?.data?.message ||
                    "Internal Server Error. Please try again later.";
                break;
            case 502:
                errorMessage =
                    error?.response?.data?.message ||
                    "Bad Gateway. The server received an invalid response.";
                break;
            case 503:
                errorMessage =
                    error?.response?.data?.message ||
                    "Service Unavailable. Please try again later.";
                break;
            case 504:
                errorMessage =
                    error?.response?.data?.message ||
                    "Gateway Timeout. The server did not respond in time.";
                break;
            default:
                errorMessage =
                    error.response.data?.error || error.response.statusText;
        }
    } else if (isCorsError(error)) {
        // Request blocked due to cross-origin.
        errorMessage =
            "CORS error: Request blocked due to cross-origin restrictions. Please check your server settings.";
    } else if (error.request) {
        // No response received from the server.
        errorMessage = "Network error. Please check your internet connection.";
    } else {
        // Other errors (e.g., programming errors, validation errors).
        errorMessage = error.message;
    }

    // Optionally set the error message in a state.
    if (setError) {
        setError(errorMessage);
    }

    // Optionally display a toast notification.
    if (showToast) {
        showToast("error", errorMessage);
    }

    // console.error("Error:", error);
};

/**
 * Error handler for API calls.
 * @param {Error} error - The error object to handle.
 * @param {Function} setError - State setter to update the error state.
 * @param {Function} showToast - Function to display toast notifications.
 * @param {Function} setLoggedIn - State setter to update login state.
 */
export const handleApiError = (error, setError, showToast, setLoggedIn) => {
    const unauthorizedErrorMessage = "Invalid token.";

    // Handle general errors.
    handleGeneralError(error, setError, showToast);

    // Additional handling for specific errors.
    if (error.response) {
        if (
            error.response.status === 200 &&
            error.response.data?.message === "Invalid OTP"
        ) {
            // Handle server verification error
            setError(error.response.data.message);
            showToast("error", error.response.data.message);
        } else if (
            error.response.status === 401 &&
            error.response.data?.error === unauthorizedErrorMessage
        ) {
            // Handle unauthorized access (invalid token).
            showToast("error", "Session expired. Please log in again.");
            setLoggedIn(false); // Log out the user.
        }
    }
};

/**
 * Error handler for form validation errors.
 * @param {Object} validationErrors - Object containing validation errors.
 * @param {Function} setFieldErrors - State setter to update field errors.
 * @param {Function} [showToast] - Optional function to display toast notifications.
 */
export const handleValidationError = (
    validationErrors,
    setFieldErrors,
    showToast = null
) => {
    // Update the form field errors state with the validation errors.
    setFieldErrors(validationErrors);

    // Optionally, display a toast notification for the first validation error.
    const firstErrorKey = Object.keys(validationErrors)[0];
    if (firstErrorKey) {
        const firstErrorMessage = validationErrors[firstErrorKey];
        if (showToast) {
            showToast("error", firstErrorMessage);
        }
    }
};

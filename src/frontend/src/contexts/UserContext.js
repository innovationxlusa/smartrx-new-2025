import { jwtDecode } from "jwt-decode";
import { createContext, useState, useContext } from "react";
import { useLocalStorage } from "../hooks/useLocalStorage"; // Custom hook to get/set accessToken from localStorage

// Create the UserContext
const UserContext = createContext();

const UserProvider = ({ children }) => {
    // Retrieve/set accessToken from localStorage
    const [accessToken, _] = useLocalStorage("accessToken", "");

    // State to store decoded user data from accessToken
    const [user, setUser] = useState(() => {
        try {
            return accessToken ? jwtDecode(accessToken) : null;
        } catch {
            return null;
        }
    });

    // State to track user login status
    const [isLoggedIn, setIsLoggedIn] = useState(false);

    // Helper function to decode and set user from the token
    const decodeToken = (token) => {
        try {
            const decodedToken = jwtDecode(token);
            setUser(decodedToken); // Set user data if token is valid
            setIsLoggedIn(true); // Update login status
        } catch (error) {
            console.error("Token decoding error:", error);
            setUser(null); // Reset user on error
            setIsLoggedIn(false); // Update login status
        }
    };

    return <UserContext.Provider value={{ user, setUser, isLoggedIn, setIsLoggedIn, decodeToken }}>{children}</UserContext.Provider>;
};

/**
 * Hook to access the UserContext.
 * This hook provides access to the user data, login status, functionality.
 * @returns {{ user: object|null, isLoggedIn: boolean }} - The current user, login status, function.
 */
const useUserContext = () => useContext(UserContext);

export { UserProvider, useUserContext };

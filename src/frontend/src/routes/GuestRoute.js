import { Navigate } from "react-router-dom";
import { useLocalStorage } from "../hooks/useLocalStorage";

const GuestRoute = ({ children }) => {
    const [accessToken] = useLocalStorage("accessToken", "");

    return !accessToken ? children : <Navigate to="/all-patient" replace />;
};

export default GuestRoute;

import { Navigate } from "react-router-dom";
import { useLocalStorage } from "../hooks/useLocalStorage";

const ProtectedRoute = ({ children }) => {
    const [accessToken] = useLocalStorage("accessToken", "");

    return accessToken ? children : <Navigate to="/signIn" replace />;
};

export default ProtectedRoute;

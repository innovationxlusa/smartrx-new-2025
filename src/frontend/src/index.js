import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import "bootstrap/dist/css/bootstrap.min.css";
import "react-toastify/dist/ReactToastify.css";
import "bootstrap/dist/js/bootstrap.bundle.min";
import "./assets/css/toastStyles.css";
import { UserProvider } from "./contexts/UserContext";
import { FolderProvider } from "./contexts/FolderContext";
import { PreviewProvider } from "./contexts/PreviewContext";

const root = ReactDOM.createRoot(document.getElementById("root"));

root.render(
    <React.StrictMode>
        <UserProvider>
            <FolderProvider>
                <PreviewProvider>
                    <App />
                </PreviewProvider>
            </FolderProvider>
        </UserProvider>
    </React.StrictMode>
);

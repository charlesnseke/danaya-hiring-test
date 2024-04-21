import PersonPage from "./pages/PersonPage";
import React from "react";
import PersonContextProvider from "./Contexts/PersonContextProvider";

function App() {
    return <>
        <PersonContextProvider>
            <div className="container mt-5">
                <PersonPage/>
            </div>
        </PersonContextProvider>
    </>
}

export default App

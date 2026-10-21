import { Outlet } from "react-router-dom";
import Header from "../components/Header.jsx";

function MainLayout() {

    return (
        <div className="bg-(--color-bg-primary)">
            <div className="
                max-w-(--container-page)
                min-h-screen
                mx-auto
                shadow-lg
                font-sans
                text-(--color-text-primary)
            ">
                <Header />
                <main>
                    <Outlet />
                </main>
            </div>
        </div>
    );
}

export default MainLayout;
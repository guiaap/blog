import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import MainLayout from "./layouts/MainLayout";
import PostsPage from "./pages/PostsPage.jsx";
import PostPage from "./pages/PostPage.jsx";

function App() {
  
  return (
    <BrowserRouter>
      <Routes>

        <Route path="/" element={<MainLayout />}>
            <Route index element={<Navigate to="posts" replace />} />
            <Route path="posts" element={<PostsPage />} />
            <Route path="posts/:id" element={<PostPage />} />
        </Route>
        
      </Routes>
    </BrowserRouter>
  );
}

export default App;

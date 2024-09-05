import "./App.css";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import DashboardPage from "@/pages/DashboardPage";
import ApplicationDetailsPage from "@/pages/ApplicationDetailsPage";
import { DASHBOARD_ROUTE, DETAILS_ROUTE } from "./routes";

const App = () => {
  return (
    <Router>
      <div>
        <Routes>
          <Route path={DASHBOARD_ROUTE} element={<DashboardPage />} />
          <Route
            path={DETAILS_ROUTE}
            element={<ApplicationDetailsPage applicationId="1" />}
          />
        </Routes>
      </div>
    </Router>
  );
};

export default App;

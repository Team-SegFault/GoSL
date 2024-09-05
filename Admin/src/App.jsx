import "./App.css";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import DashboardPage from "@/pages/DashboardPage";
import ApplicationDetailsPage from "@/pages/ApplicationDetailsPage";
import ApprovalPage from "@/pages/ApprovalPage";
import Navigation from "@/components/navigation";

const App = () => {
  return (
    <Router>
      <div>
        <Navigation />
        <Routes>
          <Route path="/" element={<DashboardPage />} />
          <Route
            path="/details"
            element={<ApplicationDetailsPage applicationId="1" />}
          />
          <Route
            path="/approval"
            element={<ApprovalPage applicationId="1" />}
          />
        </Routes>
      </div>
    </Router>
  );
};

export default App;

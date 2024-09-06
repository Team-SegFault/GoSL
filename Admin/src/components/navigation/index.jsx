import { Link } from "react-router-dom";

const Navigation = () => {
  return (
    <nav>
      <ul>
        <li>
          <Link to="/">Dashboard</Link>
        </li>
        <li>
          <Link to="/details">Application Details</Link>
        </li>
        <li>
          <Link to="/interpol">Check Interpol</Link>
        </li>
        <li>
          <Link to="/approval">Approve/Deny Application</Link>
        </li>
      </ul>
    </nav>
  );
};

export default Navigation;

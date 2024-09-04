import keycloak from "@/config/keycloak";
import { useState } from "react";

const useAuth = () => {
  const [authenticated, setAuthenticated] = useState(false);

  const login = () => {
    keycloak
      .init({ onLoad: "login-required" })
      .then((authenticated) => {
        setAuthenticated(authenticated);
      })
      .catch(() => {
        console.log("Failed to initialize Keycloak");
      });
  };

  return { authenticated, login };
};

export { useAuth };

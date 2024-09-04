import { Button } from "@/components/ui/button";
import { useKeycloak } from "@react-keycloak/web";
const LoginPage = () => {
  const { keycloak } = useKeycloak();
  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100">
      <Button
        onClick={() => {
          keycloak.login();
        }}
      >
        Login with Keycloak
      </Button>
    </div>
  );
};

export default LoginPage;

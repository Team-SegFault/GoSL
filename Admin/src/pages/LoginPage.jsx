import { Button } from "@/components/ui/button";
import { useAuth } from "@/hooks/useAuth";

const LoginPage = () => {
  const { login } = useAuth();
  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100">
      <Button onClick={login}>Login with Keycloak</Button>
    </div>
  );
};

export default LoginPage;

const useAuth = () => {
  const login = async (email, password) => {
    console.log("Logging in with:", { email, password });
  };

  return { login };
};

export { useAuth };

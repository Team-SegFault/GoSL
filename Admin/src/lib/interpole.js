const redUrl = "https://ws-public.interpol.int/notices/v1/red?";

const checkIfRed = async (firstName, lastName) => {
    const url = `${redUrl}name=${encodeURIComponent(firstName)}&forename=${encodeURIComponent(lastName)}`;
    try {
        const response = await fetch(url);
        const data = await response.json();
        return data.total > 0;
    } catch (error) {
        console.error('Error fetching data:', error);
        return "Something happened";
    }
};

// console.log( await checkIfRed("Solide", "Manley"))

export {checkIfRed}
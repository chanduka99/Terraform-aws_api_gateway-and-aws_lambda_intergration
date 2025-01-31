export const handler = async function (event, context, callback) {
  const response = {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      message: "Helllo from lambda",
    }),
  };

  return response;
};

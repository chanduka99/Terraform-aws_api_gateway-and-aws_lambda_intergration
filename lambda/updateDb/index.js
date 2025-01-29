export const handler = async function (event, context, callback) {
  return {
    statusCode: 200,
    body: JSON.stringify({ lambdaFunction: "lambda_function_updateDb" }),
  };
};

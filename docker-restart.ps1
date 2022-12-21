docker build . -t npworker

docker run `
  --name npworker `
  --rm -it --network newpayroll `
  -v "D:/Work from Home/New Payroll System/Python/new_payroll_v2/uploads:/app/uploads" `
  npworker

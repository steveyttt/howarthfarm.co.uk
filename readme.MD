# README #  

All necessary pieces to host the howarthfarm.co.uk website in a static S3 bucket.  

### Can i play localy? ###  
* download and install nodejs, i'm running v6.11.2
* npm install
* npm start
* Browse to localhost:3000

### How to deploy in S3 ###
* Official walkthrough [here](https://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html)
* Register the domain in R53 - Registered Domains
* Once officially registered, AWS will create a R53 hosted zone for you
* Create the S3 buckets (www.howarthfarm.co.uk & howarthfarm.co.uk)
* Configure both buckets for static website hosting, configure bucket www.howarthfarm.co.uk to point redirect to howarthfarm.co.uk
* Apply the s3 bucket policy to the howarthfarm.co.uk bucket 
* Upload all content for the website to howarthfarm.co.uk
* Configure 2 x R53 Alias records to point to the howarthfarm.co.uk S3 bucket


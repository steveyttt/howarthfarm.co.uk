# README #  

All necessary pieces to host the howarthfarm.co.uk website in a static S3 bucket.  

### Can i play localy? ###  
* download and install go, i'm running go1.12.4  
```go run main.go```

## How to build a local container image  
```docker build -t howarthfarm .```

## Then run it locally with  
```docker run -d -p 80:8080 --name runningsite1 mywebsite```

### How to deploy in S3 ###
* Official walkthrough [here](https://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html)
* Register the domain in R53 - Registered Domains
* Once officially registered, AWS will create a R53 hosted zone for you
* Create the S3 buckets (www.howarthfarm.co.uk & howarthfarm.co.uk)
* Configure both buckets for static website hosting, configure bucket www.howarthfarm.co.uk to point redirect to howarthfarm.co.uk
* Apply the s3 bucket policy to the howarthfarm.co.uk bucket 
* Upload all content for the website to howarthfarm.co.uk
* Configure 2 x R53 Alias records to point to the howarthfarm.co.uk S3 bucket

### Getting it on Google ###
* [Here](https://support.google.com/webmasters/answer/34397?hl=en&ref_topic=3309469)
* [AndHere](https://support.google.com/webmasters/answer/35769)
* [ANdHereNow](https://support.google.com/webmasters/answer/6259634?hl=en)
* site:howarthfarm.co.uk shows the site as indexed in google
* Added a sitemap.xml
* Submitted my URL's for google index
* I havent added a robots.txt as google crawls all pages on the site if it gets a 404 for the /robots.txt see [here](https://support.google.com/webmasters/answer/2409682)
* S3 supports the "If-Modified-Since" that googe reads when crawling
* I havent done a sitemap as it is a one page site
* altmaps have been described properly to help SEO  
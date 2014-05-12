rwdf-site-theme
===============

The Theme for [rwdfoundation.org](http://www.rwdfoundation.org/).  
The Content comes from a dropbox folder.  
The Theme and The Content get combined with [CAPE](http://www.cape.io/).  

### Hosting Features

* By storing files in Dropbox you are able to access and edit those files from almost anywhere. Hundreds of Applications and Websites seemlessly integrate with Dropbox. You can edit files on your personal computer, mobile phone, or just about any internet connected device. Never worry about FTP clients or connection protocols again!
* Files are stored on your computer, at dropbox, on our dedicated static file servers and in the Akamai Content Delivery Network. Your files are never getting lost. We can promise you that. Even if you delete a file from Dropbox it can be recovered for 30 days (or longer with the Packrat feature). Even if you saved a bad change, or if the file has been damaged, you can restore the file to an older version with only a few clicks.
* You deserve the best. So does your website. We've done the due diligence so you don't have to. You can rest assured the best tools are used for each step of the process. Your site will be running on the same enterprise infrastructure used by many of the top 100 websites.
* Hardware RAID 10 storage. Our all-data-center-grade SSD design delivers 59x more disk I/O than our previous Cloud Servers (based on internal benchmarks).
* Every host receives 40Gbps of network capacity. Fully redundant networking and power all the way to the host.
* Your sites load fast, every time. We push all the site assets to a global Content Delivery Network. Akamai delivers between 15-30% of all web traffic, leveraging over 73,000 servers in 70 countries within nearly 1,000 networks. All your website files are delivered from the server closest to the website visitor.

### Hosting Technical Description

* CAPE servers strategically located across the US check for dropbox changes every minute. When a change is found it pulls down the change, updates the database and recompiles the content with the theme. Each changed file is pushed to the Akamai CDN. Even if the compile servers becomes unavailable or require maintenance the website still remains live on the CDN.

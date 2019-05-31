# Sample
> 1. aws s3 cp /path/test.jpg s3://img.sellerhub.co.kr/pravs/goods/20170425_162917_559.jpg
> 2. aws s3 sync /images/test/sunglass/ s3://pravs/sunglass/ --acl public-read

# upload
> 1. aws s3 sync /images_new/pravs/goods/2019/01/ s3://img.sellerhub.co.kr/pravs/goods/2019/01/ --acl public-read 
> 2. aws s3 sync /images/pravs_image/ s3://img.sellerhub.co.kr/pravs_image/ --acl public-read 
> 3. aws s3 sync /images_new/editor/2018/ s3://img.sellerhub.co.kr/pravs/editor/2018/ --acl public-read 

# download
> 1. aws s3 sync s3://img.sellerhub.co.kr/pravs/goods/2018 /images_new/pravs/goods/2018/
> 2. aws s3 sync s3://img.sellerhub.co.kr/test /webservice_root/pravs/shop/data/goods/test 

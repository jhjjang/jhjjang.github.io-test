<html>
<head>
    <title>My Resources</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
</head>
<style>
.carousel-content {
    color:black;
    display:flex;
    align-items:center;
}
</style>
<body>
    <div id="carousel-example" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="row">
            <div class="col-xs-offset-3 col-xs-6">
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="carousel-content">
                            <div>
                                <h3><a href="https://jhjjang.github.io/github/">Github 멀티계정 셋팅</a></h3>
                                <p>깃헙 멀태계정 셋팅</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-content">
                            <div>
                                <h3><a href="https://jhjjang.github.io/docker/">도커</a></h3>
                                <p>도커 설치 및 사용방법</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-content">
                            <div>
                                <h3><a href="http://jhjjang.github.io/system/">System</a></h3>
                                <p>시스템 설정</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-content">
                            <div>
                                <h3><a href="https://jhjjang.github.io/machine-learning/">머신러닝</a></h3>
                                <p>머신러닝 참고 사이트</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-content">
                            <div>
                                <h3><a href="https://jhjjang.github.io/vimrc/">vimrc</a></h3>
                                <p>VI 설정</p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Controls --> <a class="left carousel-control" href="#carousel-example" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
     <a class="right carousel-control" href="#carousel-example" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>

    </div>

<script>

setCarouselHeight('#carousel-example');

function setCarouselHeight(id)
{
    var slideHeight = [];
    $(id+' .item').each(function()
    {
        // add all slide heights to an array
        slideHeight.push($(this).height());
    });

    // find the tallest item
    max = Math.max.apply(null, slideHeight);

    // set the slide's height
    $(id+' .carousel-content').each(function()
    {
        $(this).css('height',max+'px');
    });
}
</script>

</body>
</html>

import re

from bs4 import BeautifulSoup

html1 = """
<html>
	<head>
		<title>test web</title>
	</head>
	<body>
		<p align='center'> text contents </p
		<img src="C:\Python34\Koala.jpg" width="500" height="300">
	</body>
</html>"""

html2 = """
<html>
	<head>
		<title>test web</title>
	</head>
	<body>
		<p align='center'> text contents 1 </p>
		<p align='right'> text contents 2 </p>
		<p align='left'> text contents 3 </p>
		<img src="C:\Python34\Koala.jpg" width="500" height="300">
	</body>
</html>"""

html3 = """
<html>
	<head>
		<title>test web</title>
	</head>
	<body>
		<p align='center'> text contents 1 </p>
		<p align='center'> text contents 2 </p>
		<p align='center'> text contents 3 </p>
		<img src="C:\Python34\Koala.jpg" width="500" height="300">
	</body>
</html>"""

<html>
	<head>
		<title>test web</title>
	</head>
	<body>
		<p class='ptag black' align='center'> text contents 1 </p>
		<p class='ptag yellow' align='center'> text contents 2 </p>
		<p class='ptag red'	align='center'> text contents 3 </p>
		<img src="C:\Python34\Koala.jpg" width="500" height="300">


		<div class='container'>
			<p class='txt'> </p>
		</div>
	</body>
</html>

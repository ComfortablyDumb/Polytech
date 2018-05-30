#!/usr/bin/python3
from peip3 import *
from sys import *


def vignette_path(photo):
	vignette = "Photos/Vignettes/" + basename(photo)
	return vignette

def vignette_convertor(photos):
	for photo in photos:
		if ".jpg" in photo:
			vignette = vignette_path(photo)
			system("convert {} -resize 200x133 {}".format(photo,vignette))
	
def main():
	legende = open("Photos/legendes.txt","r")
	photos = direntries("Photos/*")
	vignette_convertor(photos)
	f = open("index.html","w")
	print("""<!DOCTYPE html>
<html>
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
     <title>Galerie Photos</title>
  </head>
  <body>
     <h1>Galerie Photos Peip1 (version 1)</h1>
     <ul>""",file=f)
	for photo in photos:
		if ".jpg" in photo:
			print('<a href="{0}"><img src="{1}" alt="{0}"/></a>'.format(photo,vignette_path(photo)),file=f)
			for line in legende:
				if basename(photo) in line:
					print("<br/>De jolies tomates",file=f)
			
	print('''</ul>
  </body>
</html>
''',file=f)

		


main()
	

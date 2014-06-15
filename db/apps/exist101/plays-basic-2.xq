xquery version "3.0";

declare option exist:serialize "method=xhtml media-type=text/html";
declare variable $page-title := "Our Shakespeare plays";

<html>
    <head>
        <meta HTTP-EQUIV="Content-Type" content="text/html; charset=UTF-8"/>
        <title>{$page-title}</title>
    </head>
    <body>
        <h1>{$page-title}</h1>
    </body>
</html>  
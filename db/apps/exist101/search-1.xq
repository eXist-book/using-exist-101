xquery version "3.0";

declare option exist:serialize "method=xhtml media-type=text/html";
declare variable $page-title := "Search results with XQuery";
declare variable $searchphrase := request:get-parameter("searchphrase", ());

<html>
    <head>
        <meta HTTP-EQUIV="Content-Type" content="text/html; charset=UTF-8"/>
        <title>{$page-title}</title>
    </head>
    <body>
        <h1>{$page-title}</h1>
        <p>Search phrase: "{$searchphrase}"</p>
        <ul>
        {
            for $line in collection("/db/apps/exist101/data")//SPEECH/LINE[contains(., $searchphrase)] 
            return
                <li>
                    from: {string(root($line)/PLAY/TITLE)}<br/>
                    <i>{string($line)}</i>
                </li>  
        }
        </ul>
    </body>
</html>  
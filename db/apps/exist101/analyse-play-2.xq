xquery version "3.0";

declare option exist:serialize "method=xhtml media-type=text/html";
declare variable $page-title as xs:string := "Play analysis";
declare variable $play-uri as xs:string := request:get-parameter("uri", (), true());

declare function local:word-count($elms as element()*) as xs:integer
{
    sum($elms ! count(tokenize(., "\s+")))
};

let $play-document := doc($play-uri)
let $play-title := string($play-document/PLAY/TITLE)
let $speakers := distinct-values($play-document//SPEECH/SPEAKER)
let $all-lines := $play-document//SPEECH/LINE
let $all-word-count := local:word-count($all-lines)
return
    <html>
        <head>
            <meta HTTP-EQUIV="Content-Type" content="text/html; charset=UTF-8"/>
            <title>{$page-title}</title>
        </head>
        <body>
            <h1>{$page-title}: {$play-title}</h1>
            <p>Total lines: {count($all-lines)}</p>
            <p>Total words: {$all-word-count}</p>
            <p>Total speakers: {count($speakers)}</p>
            <br/>
            <table border="1">
                <tr>
                    <th>Speaker</th>
                    <th>Lines</th>
                    <th>Words</th>
                    <th>Perc</th>
                </tr>
                {
                    for $speaker in $speakers
                    let $speaker-lines := $play-document//SPEECH[SPEAKER eq $speaker]/LINE 
                    let $speaker-word-count := local:word-count($speaker-lines)
                    let $speaker-word-perc := ($speaker-word-count div $all-word-count) * 100
                    order by $speaker
                    return
                        <tr>
                            <td>{$speaker}</td>
                            <td>{count($speaker-lines)}</td>
                            <td>{$speaker-word-count}</td>                
                            <td>{format-number($speaker-word-perc, "0.00")}%</td>   
                        </tr>
                }
            </table>
        </body>
    </html>  
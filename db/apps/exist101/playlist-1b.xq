xquery version "3.0";
<plays>
{
    let $data-collection := "/db/apps/exist101/data"
    for $resource in collection($data-collection)
    let $uri := base-uri($resource)
    return 
        <play uri="{$uri}" name="{util:unescape-uri(replace($uri, ".+/(.+)$", "$1"), "UTF-8")}">
        {
           $resource/PLAY/TITLE/text()
        }
        </play>
}
</plays>
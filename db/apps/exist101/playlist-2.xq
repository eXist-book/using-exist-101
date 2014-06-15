xquery version "3.0";
<plays>
{
    let $data-collection := "/db/apps/exist101/data"
    for $resource-name in xmldb:get-child-resources($data-collection)
    let $uri := concat($data-collection, '/', $resource-name)
    return
        <play uri="{$uri}" name="{util:unescape-uri($resource-name, "UTF-8")}">
        {
            doc($uri)/PLAY/TITLE/text()
        }
        </play>
}
</plays>
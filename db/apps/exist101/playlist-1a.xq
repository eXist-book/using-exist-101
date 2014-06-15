xquery version "3.0";
<plays>
{
    for $resource in collection("/db/apps/exist101/data")
    return 
        <play uri="{base-uri($resource)}" name="{util:unescape-uri(replace(base-uri($resource), ".+/(.+)$", "$1"), "UTF-8")}">
        {
            $resource/PLAY/TITLE/text()
        }
        </play>
}
</plays>
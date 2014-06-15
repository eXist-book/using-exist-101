xquery version "3.0" encoding "UTF-8";

module namespace x101log = "http://www.exist-db.org/book/namespaces/exist101";

declare function x101log:add-log-message($message as xs:string) as item()?
{
    let $logfile-collection := "/db/apps/exist101/log"
    let $logfile-name := "exist101-log.xml"
    let $logfile-full := concat($logfile-collection, '/', $logfile-name)
    let $logfile-created :=
        if(doc-available($logfile-full))then
            $logfile-full
        else
            xmldb:store($logfile-collection, $logfile-name, <eXist101-Log/>)
    return
        update insert <LogEntry timestamp="{current-dateTime()}">{$message}</LogEntry> 
            into doc($logfile-full)/*
};

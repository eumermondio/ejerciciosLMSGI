for $super in doc('superheroes.xml')/marvel/superheroe
let $nombre := $super/@nombre
let $poderes := $super/@poderes
let $amigos := $super/@amigos
let $nivel := $super/@nivel
where $nombre = $super/@nombre
return <superheroe>
<nombre>{data($nombre)}</nombre>
<poderes>{data($poderes)}</poderes>
<amigos>{data($amigos)}</amigos>
<nivel>{data($nivel)}</nivel>
</superheroe>
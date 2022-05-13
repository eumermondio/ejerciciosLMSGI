<html>
<table>{
for $super in doc('superheroes.xml')/marvel/superheroe
let $nombre := $super/@nombre
let $poderes := $super/@poderes
let $amigos := $super/@amigos
let $nivel := $super/@nivel
where $nombre = $super/@nombre
return <tr>
<td>{data($nombre)}</td>
<td>{data($poderes)}</td>
<td>{data($amigos)}</td>
<td>{data($nivel)}</td>
</tr>
}
</table>
</html>
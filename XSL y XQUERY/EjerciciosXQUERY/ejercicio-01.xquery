<superheroes> {
for $super in doc('superheroes.xml')/marvel/superheroe
where ends-with($super/@nombre, 'a')
return <superheroe>{ data($super/@nombre) }</superheroe>
} </superheroes>
<superheroes> {
for $super in doc('superheroes.xml')/marvel/superheroe
where contains(($super/@poderes), 'fuerza') or contains(($super/@poderes), 'Fuerza')
return <superheroe>{ data($super/@nombre) }</superheroe>
} </superheroes>
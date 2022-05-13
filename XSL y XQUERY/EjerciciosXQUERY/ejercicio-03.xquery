<superheroes> {
for $super in doc('superheroes.xml')/marvel/superheroe
where contains(($super/@poderes), 'fuerza') or contains(($super/@poderes), 'Fuerza') and contains(($super/@amigos), 'Iron Man')
return <superheroe>{ data($super/@nombre) }</superheroe>
} </superheroes>
<?php
echo"
<h3>Add new expenses except fixed price</h3>
<form method='POST' action='index.php?uc=gererFrais&action=validerCreationFrais'>
<table class='tabNonQuadrille'>
<tr>
	<td>Date of expenses (dd/mm/aaaa)</td>
	<td>
		<input  type='text' name=dateFrais  size='30' maxlength='45'>
	</td>
</tr>
<tr>
	<td>Description of expenses</td>
	<td>
		<input  type='text' name=description  size='50' maxlength='100'>
	</td>
</tr>
<tr>
	<td>Amount engages</td>
	<td>
		<input  type='text' name=montant  size='30' maxlength='45'>
	</td>
</tr>
<tr>
<td>Document in proof</td>
<td><input type='radio' name='justificatif' value='oui'> oui
</td>
<td>
<input type='radio' name='justificatif' value='non'> non
</td>

</tr>

</table>
<input type='submit' value='Valider' name='valider'>
         <input type='reset' value='Annuler' name='annuler'>

</form>
";
?>
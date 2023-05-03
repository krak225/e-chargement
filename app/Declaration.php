<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Declaration extends Model
{
    //
	protected $table = 'declaration';
	protected $primaryKey = 'declaration_id';
	public $timestamps = false;

	public function user()
    {
        return $this->hasOne(User::class, 'id','user_id');
    }
	public function declarant()
    {
        return $this->hasOne(Declarant::class, 'declarant_id','declarant_id');
    }
	public function expediteur()
    {
        return $this->hasOne(Expediteur::class, 'expediteur_id','expediteur_id');
    }
	public function bureau_sortie()
    {
        return $this->hasOne(BureauSortie::class, 'bureau_sortie_id','bureau_sortie_id');
    }
	public function regime()
    {
        return $this->hasOne(Regime::class, 'regime_id','regime_id');
    }
	public function moyen_transport()
    {
        return $this->hasOne(MoyenTransport::class, 'moyen_transport_id','moyen_transport_id');
    }
	public function destinataire()
    {
        return $this->hasOne(Destinataire::class, 'destinataire_id','destinataire_id');
    }
	public function pays()
    {
        return $this->hasOne(Pays::class, 'pays_id','pays_id');
    }
}

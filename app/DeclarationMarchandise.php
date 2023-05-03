<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class DeclarationMarchandise extends Model
{
    //
	protected $table = 'detail_declaration';
	protected $primaryKey = 'detail_declaration_id';
	public $timestamps = false;


	public function declaration()
    {
        return $this->hasOne(Declaration::class, 'declaration_id','declaration_id');
    }
	public function marchandise()
    {
        return $this->hasOne(Marchandise::class, 'marchandise_id','marchandise_id');
    }
}

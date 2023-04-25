<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Agent_douane extends Model
{
    //
	protected $table = 'agent_douane';
	protected $primaryKey = 'agent_douane_id';
	public $timestamps = false;

}

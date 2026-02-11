<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function index()
    {
        $data['comentarios']    = Comment::orderBy('fecha', 'DESC')->get();
        return view('admin.comments.home', $data);
    }

    public function save(Request $request)
    {
        if(!$request->ajax())
        {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }

        $fecha              = $request->input('fecha');
        $comentario         = trim($request->input('comment'));

        Comment::insert([
            'fecha'         => date('Y-m-d'),
            'comentario'    => mb_strtoupper($comentario)
        ]);
        echo json_encode([
            'status'    => true,
            'msg'       => 'Comentario enviado con éxito',
            'type'      => 'success'
        ]);
    }
}

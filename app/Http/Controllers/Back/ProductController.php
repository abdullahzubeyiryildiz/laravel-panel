<?php

namespace App\Http\Controllers\Back;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Str;
use App\Models\Category;
use Illuminate\Support\Facades\File;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories=Category::all();
        $products = Product::orderBy('created_at','DESC')->get();
        return view('back.products.index',compact('categories', 'products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        return view('back.products.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'title'=>'min:3',
            'image'=>'required|image|mimes:jpeg,png,jpg|max:2048'
          ]);
        
       $product=new Product;
       $product->name=$request->name;
       $product->content=$request->content;
       $slug = Str::slug($request->name, '-');
       $product->slug=$slug;
       
       if($request->hasFile('image')) {
           $imageName = Str::slug($request->name, '-').'.'.$request->image->getClientOriginalExtension();
           $request->image->move(public_path('uploads'),$imageName);
           $product->image='uploads/'.$imageName;
       }
       $product->save();
       toastr()->success('Başarılı','Ürün Başarıyla Oluşturuldu.');
       return redirect()->route('admin.urunler.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product=Product::findOrFail($id);
        //dd($product);
        return view('back.products.update',compact('product'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'title'=>'min:3',
            'image'=>'image|mimes:jpeg,png,jpg|max:2048'
          ]);
        
       $product= Product::findOrFail($id);
       $product->name=$request->name;
       $product->content=$request->content;
       $slug = Str::slug($request->name, '-');
       $product->slug=$slug;
       
       if($request->hasFile('image')) {
           $imageName = Str::slug($request->name, '-').'.'.$request->image->getClientOriginalExtension();
           $request->image->move(public_path('uploads'),$imageName);
           $product->image='uploads/'.$imageName;
       }
       $product->save();
       toastr()->success('Başarılı','Ürün Başarıyla Güncellendi.');
       return redirect()->route('admin.urunler.index');

    }


    public function switch(Request $request){
        $product=Product::findOrFail($request->id);
        $product->status=$request->statu=="true" ? 1 : 0 ;
        $product->save();
      }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function delete($id){
        Product::find($id)->delete();
        toastr()->success('Ürün Silindi Geri dönüşüme Taşındı.');
        return redirect()->route('admin.urunler.index');
      }

      public function trashed(){
        $products= Product::onlyTrashed()->orderBy('deleted_at','desc')->get();
        return view('back.products.trashed',compact('products'));
      }

      public function recover($id){
        Product::onlyTrashed()->find($id)->restore();
        toastr()->success('Ürün başarıyla kurtarıldı.');
        return redirect()->back();
      }

      public function hardDelete($id){
        $product=Product::onlyTrashed()->find($id);
        if(File::exists($product->image)){
          File::delete(public_path($product->image));
        }

        $product->forceDelete();
        toastr()->success('Ürün başarıyla Kalıcı Olarak silindi');
        return redirect()->route('admin.urunler.index');
      }
      
   
}
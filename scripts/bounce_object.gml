///scr_blob(texture,radius,bounce,quality,solid_parent)

////////////////////////////////////////////
////////////////////////////////////////////
////////////////////////////////////////////
//Initialize:
blob_t=argument0                //Texture
blob_r=argument1                //Radius
if !variable_instance_exists(id,"blob_q"){
    blob_b=100*argument2/argument3  //Bouncyness
    blob_q=argument3                //Quality
    blob_s=argument4                //Solid parent (what objects to colide with)
    blob_a=0                        //Angle
    blob_rs=0                       //Rotational speed
    blob_rn=(1+20/blob_q)           //Round "corners (when colliding with things) Don't change
    blob_db=true                    //Whether or not to draw twice as many vertexes are there are "arms"
    for (i=0;i<=blob_q;i+=1){
        blob_l[i]=blob_r
        blob_d[i]=2*pi*i/blob_q+pi/2
        blob_dc[i]=cos(blob_d[i])
        blob_ds[i]=sin(blob_d[i])}
    u_start=blob_r/10
    u_s_add=blob_r/6
    u_to=blob_r+u_s_add
    blob_sl=floor(40/blob_q)}
////////////////////////////////////////////
////////////////////////////////////////////
//Anti-stuck
if collision_line(x,y,xprevious,yprevious,blob_s,true,true){
    if !collision_line(xprevious,yprevious,xprevious,y,blob_s,true,true){x=xprevious hspeed=0}
    else {
        if !collision_line(xprevious,yprevious,x,yprevious,blob_s,true,true){y=yprevious vspeed=0}
        else{
            speed=0
            x=xprevious
            y=yprevious}}
            if collision_circle(x,y,1,blob_s,true,true){
                for (s=5;s<blob_r;s+=5){
                    for (d=0;d<360;d+=20){
                        xx=x+lengthdir_x(s,d)
                        yy=y+lengthdir_y(s,d)
                        if !collision_circle(xx,yy,1,blob_s,true,true){
                            x=xx
                            xprevious=xx
                            y=yy
                            yprevious=yy
                            d=360
                            s=blob_r
                            break;}}}}}
////////////////////////////////////////////
////////////////////////////////////////////
//Physics
var Fx,Fy,F,c,s,u;
Fx=0
Fy=0
if collision_circle(x,y,blob_r,blob_s,true,true){blob_rs*=0.8}
for (i=0;i<blob_q;i+=1){
    c=blob_dc[i]
    s=blob_ds[i]
    u=blob_r
    blob_l[i]=u
    if collision_line(x,y,x+u*c,y-u*s,blob_s,1,1)>0{
        u_add=u_s_add
        test=true
        for (u=u_start;u<u_to;u+=u_add){
            if collision_line(x,y,x+u*c,y-u*s,blob_s,1,1){
                if test=true{
                    u-=u_add
                    u_add=1
                    test=false}
                else{break;}}}
        u=min(u,blob_r)
        uu=u/blob_r
        blob_rs+=2*sin(degtorad(direction)-blob_d[i])*speed/((10+blob_q)*uu)  //Rotate
        F=blob_b*(1-uu)
        Fx-=F*c
        Fy-=F*s
        blob_l[i]=u}}
hspeed+=Fx
vspeed-=Fy
blob_a+=blob_rs
blob_l[blob_q]=blob_l[0]

////////////////////////////////////////////
////////////////////////////////////////////
//Drawing:
draw_set_color(c_white)
draw_primitive_begin_texture(pr_trianglefan,blob_t)
draw_vertex_texture(x,y,0.5,0.5)
for (i=0;i<blob_q;i+=1){
    blob_l[i]=min((blob_r+blob_l[i]+blob_l[(i+1) mod blob_q]+blob_l[(i-1+blob_q) mod blob_q])/4,blob_l[i])
    d=blob_d[i]+degtorad(blob_a)
    draw_vertex_texture(x+blob_l[i]*blob_dc[i],y-blob_l[i]*blob_ds[i],0.5*(1+cos(d)),0.5*(1-sin(d)))
    if blob_db=true{
        ii=i+1
        d1=(blob_d[i]+blob_d[ii])/2
        d=d1+degtorad(blob_a)
        l=(blob_l[i]+blob_l[ii])/2
        draw_vertex_texture(x+l*cos(d1),y-l*sin(d1),0.5*(1+cos(d)),0.5*(1-sin(d)))}}
d=degtorad(blob_a)+pi/2
draw_vertex_texture(x,y-blob_l[0],0.5*(1+cos(d)),0.5*(1-sin(d)))
draw_primitive_end()

image_angle=degtorad(blob_a)+pi/2

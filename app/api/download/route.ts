import path from "path";
import fs from "fs";
import { NextRequest } from 'next/server';


export async function GET(request : NextRequest) {
    // Extract the query parameters from the request URL
    const url = new URL(request.url);
    const filename = url.searchParams.get("filename");

    if (!filename) {
        return new Response("Filename not specified", {
            status: 400,
            headers: {
                "Access-Control-Allow-Origin": "*", // Allow all origins
                "Access-Control-Allow-Methods": "GET, OPTIONS",
            },
        });
    }

    // Resolve the file path dynamically based on the filename
    const filePath = path.resolve(`./public/${filename}`);

    if (!fs.existsSync(filePath)) {
        return new Response("File not found", {
            status: 404,
            headers: {
                "Access-Control-Allow-Origin": "*", // Allow all origins
                "Access-Control-Allow-Methods": "GET, OPTIONS",
            },
        });
    }

    const fileBuffer = fs.readFileSync(filePath);
    return new Response(fileBuffer, {
        headers: {
            "Content-Type": "text/plain",
            "Content-Disposition": `attachment; filename=${filename}`,
            "Access-Control-Allow-Origin": "*", // Allow all origins
            "Access-Control-Allow-Methods": "GET, OPTIONS",
        },
    });
}
